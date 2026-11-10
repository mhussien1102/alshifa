import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';

class AppChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const AppChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : AppColors.surface,
      clipBehavior: Clip.antiAlias,
      shape: StadiumBorder(
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.border,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: AppSizes.circleButton,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.xl),
            child: Center(
              widthFactor: 1,
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  color: selected ? Colors.white : AppColors.textPrimary,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}