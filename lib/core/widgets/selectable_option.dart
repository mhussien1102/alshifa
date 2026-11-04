import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';

class SelectableOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const SelectableOption({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primaryTintLight : AppColors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusField),
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.border,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: AppSizes.secondaryButtonHeight,
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 16,
                color: selected
                    ? AppColors.primaryDark
                    : AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}