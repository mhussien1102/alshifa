import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/formaters.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/entities/payment_method.dart';
import 'summary_row.dart';

class PaymentBottomBar extends StatelessWidget {
  final double total;
  final PaymentMethod method;
  final VoidCallback onPay;

  const PaymentBottomBar({
    super.key,
    required this.total,
    required this.method,
    required this.onPay,
  });

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
              SummaryRow(label: 'الإجمالي', value: totalText, emphasized: true),
              const SizedBox(height: AppSizes.md),
              CustomButton(
                text: method == PaymentMethod.cash
                    ? 'تأكيد الطلب'
                    : 'ادفع $totalText',
                onPressed: onPay,
              ),
            ],
          ),
        ),
      ),
    );
  }
}