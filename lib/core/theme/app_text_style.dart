import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Text styles - الخط المحلي IBM Plex Sans Arabic (مسجل في pubspec.yaml)
abstract final class AppTextStyles {
  static const String fontFamily = 'IBMPlexSansArabic';

  static TextStyle _base({
    required double size,
    required FontWeight weight,
    Color color = AppColors.textPrimary,
    double height = 1.4,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      );

  static final headlineLarge = _base(size: 28, weight: FontWeight.w700);
  static final headlineMedium = _base(size: 24, weight: FontWeight.w700);
  static final price =
  _base(size: 28, weight: FontWeight.w700, color: AppColors.primary);
  static final titleMedium = _base(size: 16, weight: FontWeight.w700);
  static final bodyMedium = _base(
    size: 14,
    weight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.6,
  );
  static final label = _base(size: 14, weight: FontWeight.w600);
  static final button =
  _base(size: 17, weight: FontWeight.w700, color: Colors.white);
  static final caption = _base(
    size: 12,
    weight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static final link =
  _base(size: 14, weight: FontWeight.w700, color: AppColors.primary);

  static TextTheme get textTheme => TextTheme(
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    titleMedium: titleMedium,
    bodyMedium: bodyMedium,
    labelLarge: label,
    bodySmall: caption,
  );
}