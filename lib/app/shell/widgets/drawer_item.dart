import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_size.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;
  final Color? color;
  final Widget? trailing;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
    this.color,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final itemColor =
        color ?? (selected ? AppColors.primaryDark : AppColors.textPrimary);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.xs),
      child: Material(
        color: selected ? AppColors.primaryTint : Colors.transparent,
        borderRadius: BorderRadius.circular(AppSizes.radiusField + 2),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 52,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
              child: Row(
                children: [
                  Icon(icon, size: 24, color: itemColor),
                  const SizedBox(width: AppSizes.lg),
                  Expanded(
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 17,
                        color: itemColor,
                        fontWeight:
                        selected ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}