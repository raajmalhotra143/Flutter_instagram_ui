import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../core/constants/spacing.dart';

class ShimmerPost extends StatelessWidget {
  const ShimmerPost({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.grey[850]! : Colors.grey[300]!;
    final highlightColor = isDark ? Colors.grey[800]! : Colors.grey[100]!;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenHPadding, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: AppSpacing.postAvatarSize,
                  height: AppSpacing.postAvatarSize,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.postAvatarTextGap),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 80,
                      height: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Image placeholder
          AspectRatio(
            aspectRatio: AppSpacing.postImageAspectRatio,
            child: Container(color: Colors.white),
          ),
          
          // Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.postBottomHPadding, vertical: 12),
            child: Row(
              children: [
                Container(width: 24, height: 24, color: Colors.white),
                const SizedBox(width: 16),
                Container(width: 24, height: 24, color: Colors.white),
                const SizedBox(width: 16),
                Container(width: 24, height: 24, color: Colors.white),
                const Spacer(),
                Container(width: 24, height: 24, color: Colors.white),
              ],
            ),
          ),
          
          // Likes/Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.postBottomHPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 14,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 14,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                Container(
                  width: 200,
                  height: 14,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
