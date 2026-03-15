import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post_model.dart';
import '../providers/post_provider.dart';
import '../core/constants/colors.dart';
import '../core/constants/spacing.dart';

class PostActions extends ConsumerWidget {
  final PostModel post;

  const PostActions({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionsProvider = ref.read(postActionsProvider);
    final iconColor = Theme.of(context).brightness == Brightness.dark 
        ? AppColors.textPrimaryDark 
        : AppColors.textPrimaryLight;

    return Container(
      height: AppSpacing.postActionsHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenHPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Like
              GestureDetector(
                onTap: () => actionsProvider.toggleLike(post),
                child: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: post.isLiked ? AppColors.likeActive : iconColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.postActionIconGap),
              
              // Comment (Figma comment icon proxy)
              Icon(Icons.chat_bubble_outline, color: iconColor, size: 24),
              const SizedBox(width: AppSpacing.postActionIconGap),
              
              // Share/Messenger
              Icon(Icons.send_outlined, color: iconColor, size: 24),
            ],
          ),
          
          // Carousel indicators are handled natively in the carousel widget's stack/position,
          // but if we were to place them precisely here, we could add a Spacer.
          
          // Save
          GestureDetector(
            onTap: () => actionsProvider.toggleSave(post),
            child: Icon(
              post.isSaved ? Icons.bookmark : Icons.bookmark_border,
              color: iconColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
