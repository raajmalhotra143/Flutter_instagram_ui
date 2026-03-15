import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post_model.dart';
import '../models/story_model.dart';
import '../services/post_repository.dart';

class FeedState {
  final List<PostModel> posts;
  final List<StoryModel> stories;
  final bool isLoading;
  final bool isFetchingMore;
  final bool hasMore;

  const FeedState({
    this.posts = const [],
    this.stories = const [],
    this.isLoading = true,
    this.isFetchingMore = false,
    this.hasMore = true,
  });

  FeedState copyWith({
    List<PostModel>? posts,
    List<StoryModel>? stories,
    bool? isLoading,
    bool? isFetchingMore,
    bool? hasMore,
  }) {
    return FeedState(
      posts: posts ?? this.posts,
      stories: stories ?? this.stories,
      isLoading: isLoading ?? this.isLoading,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class FeedNotifier extends StateNotifier<FeedState> {
  final PostRepository _repository;
  int _currentPage = 0;

  FeedNotifier(this._repository) : super(const FeedState()) {
    _initialLoad();
  }

  Future<void> _initialLoad() async {
    state = state.copyWith(isLoading: true);
    
    // Fetch stories and first page of posts concurrently
    try {
      final results = await Future.wait([
        _repository.fetchStories(),
        _repository.fetchFeed(page: 0),
      ]);
      
      final stories = results[0] as List<StoryModel>;
      final posts = results[1] as List<PostModel>;

      state = state.copyWith(
        stories: stories,
        posts: posts,
        isLoading: false,
        hasMore: posts.isNotEmpty,
      );
      _currentPage = 1;

    } catch (e) {
      state = state.copyWith(isLoading: false);
      // Handle error natively in a production app
    }
  }

  Future<void> fetchMore() async {
    if (!state.hasMore || state.isFetchingMore || state.isLoading) return;

    state = state.copyWith(isFetchingMore: true);

    try {
      final newPosts = await _repository.fetchFeed(page: _currentPage);
      
      if (newPosts.isEmpty) {
        state = state.copyWith(isFetchingMore: false, hasMore: false);
      } else {
        state = state.copyWith(
          posts: [...state.posts, ...newPosts],
          isFetchingMore: false,
        );
        _currentPage++;
      }
    } catch (e) {
      state = state.copyWith(isFetchingMore: false);
    }
  }
  
  void updatePost(PostModel updatedPost) {
    state = state.copyWith(
      posts: state.posts.map((p) => p.id == updatedPost.id ? updatedPost : p).toList(),
    );
  }
}

final feedProvider = StateNotifierProvider<FeedNotifier, FeedState>((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return FeedNotifier(repository);
});
