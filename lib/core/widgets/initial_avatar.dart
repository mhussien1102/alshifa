import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../utils/text_utils.dart';

class InitialAvatar extends StatelessWidget {
  final String name;
  final double size;
  final Color background;
  final Color color;

  const InitialAvatar({
    super.key,
    required this.name,
    this.size = AppSizes.avatar,
    this.background = AppColors.primaryTint,
    this.color = AppColors.primaryDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: background, shape: BoxShape.circle),
      child: Text(
        TextUtils.initialOf(name),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: size * 0.4,
          color: color,
          height: 1.2,
        ),
      ),
    );
  }
}