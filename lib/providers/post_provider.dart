import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post_model.dart';
import 'feed_provider.dart';

final postActionsProvider = Provider((ref) => PostActionsService(ref));

class PostActionsService {
  final Ref _ref;

  PostActionsService(this._ref);

  void toggleLike(PostModel post) {
    final updatedPost = post.copyWith(
      isLiked: !post.isLiked,
      likesCount: post.isLiked ? post.likesCount - 1 : post.likesCount + 1,
    );
    
    // Update local state in feed provider
    _ref.read(feedProvider.notifier).updatePost(updatedPost);
    
    // In real app, make API call to backend here
  }

  void toggleSave(PostModel post) {
    final updatedPost = post.copyWith(isSaved: !post.isSaved);
    _ref.read(feedProvider.notifier).updatePost(updatedPost);
  }
}
