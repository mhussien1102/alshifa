import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';

/// شريط التحميل الأصفر + نص "جارٍ التحميل"
class SplashLoadingBar extends StatelessWidget {
  const SplashLoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppSizes.loadingBarWidth,
          height: AppSizes.loadingBarHeight,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(AppSizes.radiusPill),
          ),
        ),
        const SizedBox(height: AppSizes.lg),
        Text(
          'جارٍ التحميل',
          style: textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}