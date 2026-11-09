import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import 'summary_row.dart';

class ProductInfoTable extends StatelessWidget {
  final String size;
  final String category;

  const ProductInfoTable({
    super.key,
    required this.size,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final rows = <({String label, String value})>[
      (label: 'الحجم', value: size),
      (label: 'الفئة', value: category),
      (label: 'الاستلام', value: 'من صيدلية المستشفى'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            if (i > 0) const Divider(height: 1, color: AppColors.border),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.lg,
                vertical: AppSizes.md + 2,
              ),
              child: SummaryRow(label: rows[i].label, value: rows[i].value),
            ),
          ],
        ],
      ),
    );
  }
}