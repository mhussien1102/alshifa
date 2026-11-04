import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';

class IconTile extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final Color background;
  final Color iconColor;

  const IconTile({
    super.key,
    required this.icon,
    this.size = AppSizes.iconTileLarge,
    this.iconSize = 32,
    this.background = AppColors.primaryTint,
    this.iconColor = AppColors.primaryDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppSizes.radiusTile),
      ),
      child: Icon(icon, size: iconSize, color: iconColor),
    );
  }
}