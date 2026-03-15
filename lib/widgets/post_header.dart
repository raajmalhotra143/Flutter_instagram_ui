import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/user_model.dart';
import '../core/constants/spacing.dart';
import '../core/constants/typography.dart';
import '../core/constants/colors.dart';

class PostHeader extends StatelessWidget {
  final UserModel user;

  const PostHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.postHeaderHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenHPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar
          Container(
            width: AppSpacing.postAvatarSize,
            height: AppSpacing.postAvatarSize,
            margin: const EdgeInsets.only(right: AppSpacing.postAvatarTextGap),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.separatorDark
                    : AppColors.separatorLight,
                width: 0.5,
              ),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: user.profileImageUrl,
                fit: BoxFit.cover,
                errorWidget: (_, _, _) => const Icon(Icons.person),
              ),
            ),
          ),
          
          // User info
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.username,
                  style: AppTypography.postUsername,
                ),
                if (user.location != null)
                  Text(
                    user.location!,
                    style: AppTypography.postLocation,
                  ),
              ],
            ),
          ),
          
          // More options
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
            onPressed: () {},
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
