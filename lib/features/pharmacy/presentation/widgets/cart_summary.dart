import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/formaters.dart';
import '../../../../core/widgets/custom_button.dart';
import 'summary_row.dart';

class CartSummary extends StatelessWidget {
  final double total;
  final VoidCallback onCheckout;

  const CartSummary({super.key, required this.total, required this.onCheckout});

  @override
  Widget build(BuildContext context) {
    final totalText = Formatters.price(total);

    return Material(
      color: AppColors.surface,
      shape: const Border(top: BorderSide(color: AppColors.border)),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.screenPadding,
            AppSizes.lg,
            AppSizes.screenPadding,
            AppSizes.xxl,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SummaryRow(label: 'المجموع', value: totalText),
              const SizedBox(height: AppSizes.sm),
              const SummaryRow(label: 'الاستلام', value: 'من صيدلية المستشفى'),
              const SizedBox(height: AppSizes.md),
              const Divider(height: 1, color: AppColors.border),
              const SizedBox(height: AppSizes.md),
              SummaryRow(label: 'الإجمالي', value: totalText, emphasized: true),
              const SizedBox(height: AppSizes.md),
              CustomButton(text: 'إتمام الطلب', onPressed: onCheckout),
            ],
          ),
        ),
      ),
    );
  }
}