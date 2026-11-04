import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/data_helper.dart';
import '../../../../core/utils/formaters.dart';

class BirthDateSummary extends StatelessWidget {
  final DateTime? date;

  const BirthDateSummary({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final valueStyle = textTheme.titleMedium?.copyWith(
      fontSize: 18,
      color: AppColors.primaryDark,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryTint,
        borderRadius: BorderRadius.circular(AppSizes.radiusField + 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('التاريخ المختار', style: textTheme.bodySmall),
              Text(
                date == null ? '—' : Formatters.date(date!),
                style: valueStyle,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('السن', style: textTheme.bodySmall),
              Text(
                date == null
                    ? '—'
                    : Formatters.age(DateHelpers.calculateAge(date!)),
                style: valueStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}