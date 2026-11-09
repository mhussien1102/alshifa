import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';

class PaymentMethodTile extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool selected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = selected ? AppColors.primaryDark : AppColors.textPrimary;

    return Material(
      color: selected ? AppColors.primaryTintLight : AppColors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusField + 2),
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.border,
          width: selected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 72,
          child: Center(
            child: icon == null
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: color,
                  height: 1.2,
                ),
              ),
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 24, color: color),
                const SizedBox(height: AppSizes.sm),
                Text(
                  label,
                  style: textTheme.labelLarge?.copyWith(
                    fontSize: 14,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}