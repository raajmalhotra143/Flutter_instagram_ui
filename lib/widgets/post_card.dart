import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../core/constants/typography.dart';
import '../core/constants/colors.dart';
import '../core/constants/spacing.dart';
import 'post_header.dart';
import 'post_carousel.dart';
import 'post_actions.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        PostHeader(user: post.user),
        PostCarousel(imageUrls: post.imageUrls),
        
        // Bottom Section
        Container(
          // Allow flexible height instead of clamping exact to AppSpacing.postBottomHeight
          // to accommodate text wrapping
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon actions
              PostActions(post: post),
              
              // Likes info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.postBottomHPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    if (post.likedBy.isNotEmpty)
                      RichText(
                        text: TextSpan(
                          style: AppTypography.likesInfo.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark 
                                ? AppColors.textPrimaryDark 
                                : AppColors.textPrimaryLight,
                          ),
                          children: [
                            const TextSpan(text: 'Liked by '),
                            TextSpan(
                              text: post.likedBy.first.username,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: '${post.likesCount} others',
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    else 
                      Text(
                        '${post.likesCount} likes',
                        style: AppTypography.likesInfo.copyWith(fontWeight: FontWeight.w600),
                      ),
                      
                    const SizedBox(height: 6),
                    
                    // Caption
                    RichText(
                      text: TextSpan(
                        style: AppTypography.captionBody.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark 
                              ? AppColors.textPrimaryDark 
                              : AppColors.textPrimaryLight,
                        ),
                        children: [
                          TextSpan(
                            text: '${post.user.username} ',
                            style: AppTypography.captionUsername,
                          ),
                          TextSpan(text: post.caption),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 6),
                    Text(
                      'View all ${post.commentsCount} comments',
                      style: AppTypography.captionBody.copyWith(color: AppColors.textSecondary),
                    ),
                    
                    const SizedBox(height: 4),
                    Text(
                      'September 19', // Or format post.createdAt
                      style: AppTypography.timestamp.copyWith(color: AppColors.textTimestamp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
