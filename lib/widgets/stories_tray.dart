import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/story_model.dart';
import '../core/constants/colors.dart';
import '../core/constants/typography.dart';
import '../core/constants/spacing.dart';

class StoriesTray extends StatelessWidget {
  final List<StoryModel> stories;

  const StoriesTray({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    if (stories.isEmpty) return const SizedBox();

    return Container(
      height: AppSpacing.storiesTrayHeight,
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.separatorDark : AppColors.separatorLight,
            width: AppSpacing.dividerThickness,
          ),
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenHPadding, 
          vertical: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.storyItemGap),
        itemBuilder: (context, index) {
          final story = stories[index];
          final isMe = index == 0;
          return _StoryItem(story: story, isMe: isMe);
        },
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  final StoryModel story;
  final bool isMe;

  const _StoryItem({required this.story, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.backgroundDark : AppColors.backgroundLight;

    return SizedBox(
      width: AppSpacing.storyAvatarOuter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Gradient Ring
              Container(
                width: AppSpacing.storyAvatarOuter,
                height: AppSpacing.storyAvatarOuter,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: story.isSeen || isMe
                      ? null
                      : const LinearGradient(
                          colors: AppColors.storyGradient,
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                  border: story.isSeen || isMe
                      ? Border.all(
                          color: AppColors.storyRingSeen, 
                          width: AppSpacing.storyRingStroke - 1,
                        )
                      : null,
                ),
                padding: const EdgeInsets.all(AppSpacing.storyRingStroke), // Ring thickness
                child: Container(
                  decoration: BoxDecoration(
                    color: bg, // White/Black gap
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(AppSpacing.storyRingGap), // Gap thickness
                  child: ClipOval(
                    child: story.user.profileImageUrl.startsWith('assets/')
                    ? Image.asset(
                        story.user.profileImageUrl,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: story.user.profileImageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(Icons.person),
                      ),
              ),
              
              if (isMe)
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: bg,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.brandBlue,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(2),
                      child: const Icon(Icons.add, size: 12, color: Colors.white),
                    ),
                  ),
                ),
                
              if (story.isLive)
                Positioned(
                  bottom: -6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE1306C), Color(0xFFF56040)],
                      ),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: bg, width: 1.5),
                    ),
                    child: Text(
                      'LIVE',
                      style: AppTypography.storyUsername.copyWith(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            story.user.username,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.storyUsername,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
