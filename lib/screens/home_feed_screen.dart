import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/feed_provider.dart';
import '../widgets/top_bar.dart';
import '../widgets/stories_tray.dart';
import '../widgets/post_card.dart';
import '../widgets/shimmer_post.dart';

class HomeFeedScreen extends ConsumerStatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  ConsumerState<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends ConsumerState<HomeFeedScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 500) {
      ref.read(feedProvider.notifier).fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedProvider);

    return Scaffold(
      appBar: const TopBar(),
      body: feedState.isLoading && feedState.posts.isEmpty
          ? ListView.builder(
              itemCount: 3,
              itemBuilder: (_, _) => const ShimmerPost(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                // Ignore for assignment simplicity, or re-init feedProvider
              },
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: StoriesTray(stories: feedState.stories),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return PostCard(post: feedState.posts[index]);
                      },
                      childCount: feedState.posts.length,
                    ),
                  ),
                  if (feedState.isFetchingMore)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    ),
                  if (!feedState.hasMore && !feedState.isLoading)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Center(
                          child: Text('No more posts', style: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    )
                ],
              ),
            ),
    );
  }
}
