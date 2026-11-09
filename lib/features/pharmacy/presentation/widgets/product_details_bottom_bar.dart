import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/quantity_stepper.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onViewCart;

  const ProductDetailsBottomBar({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onIncrement,
    required this.onDecrement,
    required this.onViewCart,
  });

  @override
  Widget build(BuildContext context) {
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
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: quantity == 0
                ? CustomButton(
              key: const ValueKey('add'),
              text: 'أضف إلى العربة',
              onPressed: onAdd,
            )
                : Row(
              key: const ValueKey('actions'),
              children: [
                SizedBox(
                  width: 162,
                  child: QuantityStepper(
                    quantity: quantity,
                    height: AppSizes.buttonHeight,
                    padding: 5,
                    onIncrement: onIncrement,
                    onDecrement: onDecrement,
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: CustomButton(
                    text: 'عرض العربة',
                    onPressed: onViewCart,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}