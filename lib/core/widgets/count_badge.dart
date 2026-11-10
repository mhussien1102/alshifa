import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../utils/formaters.dart';

class CountBadge extends StatelessWidget {
  final int count;

  const CountBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm - 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(AppSizes.radiusPill),
      ),
      child: Text(
        Formatters.digits(count),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.2,
        ),
      ),
    );
  }
}