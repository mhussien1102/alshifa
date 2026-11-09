import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';

class StatusBadge extends StatelessWidget {
  final String text;
  final Color background;
  final Color color;

  const StatusBadge({
    super.key,
    required this.text,
    this.background = AppColors.primaryTint,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.xs + 2,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppSizes.radiusPill),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}