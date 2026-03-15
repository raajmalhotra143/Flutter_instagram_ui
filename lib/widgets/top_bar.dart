import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/typography.dart';
import '../core/constants/spacing.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;

    return Container(
      color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: AppSpacing.appBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenHPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Camera / Logo
              Row(
                children: [
                  Icon(Icons.camera_alt_outlined, color: iconColor),
                  const SizedBox(width: 8),
                  Text('Instagram', style: AppTypography.wordmark),
                ],
              ),
              // Actions
              Row(
                children: [
                  // IGTV placeholder
                  Icon(Icons.live_tv_outlined, color: iconColor),
                  const SizedBox(width: AppSpacing.screenHPadding),
                  // Messenger with dot
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.send_outlined, color: iconColor),
                      Positioned(
                        top: -2,
                        right: -4,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: AppColors.notificationDot,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSpacing.appBarHeight);
}
