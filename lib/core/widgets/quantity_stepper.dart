import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../utils/formaters.dart';

class QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final double height;

  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.height = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.primaryTint,
        borderRadius: BorderRadius.circular(AppSizes.radiusField),
      ),
      child: Row(
        children: [
          _StepButton(
            size: height - 4,
            icon: LucideIcons.minus,
            background: AppColors.surface,
            color: AppColors.textPrimary,
            onPressed: onDecrement,
          ),
          Expanded(
            child: Center(
              child: Text(
                Formatters.digits(quantity),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
          ),
          _StepButton(
            size: height - 4,
            icon: LucideIcons.plus,
            background: AppColors.primary,
            color: Colors.white,
            onPressed: onIncrement,
          ),
        ],
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final Color background;
  final Color color;
  final VoidCallback onPressed;

  const _StepButton({
    required this.size,
    required this.icon,
    required this.background,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppSizes.md),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, size: 20, color: color),
        ),
      ),
    );
  }
}