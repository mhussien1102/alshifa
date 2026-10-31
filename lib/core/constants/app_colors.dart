import 'package:flutter/material.dart';

/// ألوان التطبيق (تقديرية من التصميم - راجعها في Figma Dev Mode)
abstract final class AppColors {
  // Brand
  static const primary = Color(0xFF0E7C86);
  static const primaryDark = Color(0xFF0B4F58);
  static const primaryTint = Color(0xFFDBEEF1);
  static const primaryTintLight = Color(0xFFEEF8F9);
  static const primaryTintBorder = Color(0xFFBFE0E4);
  static const accent = Color(0xFFF2B544);

  // Surfaces
  static const background = Color(0xFFF5F7F7);
  static const surface = Color(0xFFFFFFFF);
  static const border = Color(0xFFCFD8D8);
  static const scrim = Color(0xFF2C4448);

  // Text
  static const textPrimary = Color(0xFF10282C);
  static const textSecondary = Color(0xFF6B7C80);

  // Status
  static const error = Color(0xFFC0432A);
  static const success = Color(0xFF2E8B57);
  static const info = Color(0xFF3E6FB8);
  static const warningBg = Color(0xFFFBEBC8);
  static const warningText = Color(0xFF8A5A00);
}

/// ألوان المنتجات: خلفية فاتحة + لون أيقونة غامق
enum ProductColorScheme {
  teal(Color(0xFFDBEEF1), Color(0xFF0E7C86)),
  amber(Color(0xFFFBEBC8), Color(0xFFC98A10)),
  pink(Color(0xFFFCE3DC), Color(0xFFC0432A)),
  purple(Color(0xFFE8E4F3), Color(0xFF6B4FB0));

  const ProductColorScheme(this.background, this.icon);
  final Color background;
  final Color icon;
}