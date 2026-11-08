import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool emphasized;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.emphasized = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: emphasized
              ? textTheme.titleMedium?.copyWith(fontSize: 18)
              : textTheme.bodyMedium?.copyWith(fontSize: 15),
        ),
        Text(
          value,
          style: emphasized
              ? textTheme.titleMedium?.copyWith(
            fontSize: 20,
            color: AppColors.primary,
          )
              : textTheme.labelLarge?.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}