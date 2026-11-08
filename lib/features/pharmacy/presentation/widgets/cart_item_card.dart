import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/formaters.dart';
import '../../../../core/widgets/quantity_stepper.dart';
import '../../domain/entities/cart_item.dart';
import 'product_image_tile.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = ProductColorScheme.values.byName(item.product.color.name);

    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          ProductImageTile(scheme: scheme, width: 72, height: 72),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(fontSize: 15),
                ),
                const SizedBox(height: AppSizes.sm),
                Row(
                  children: [
                    Text(
                      Formatters.price(item.lineTotal),
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 108,
                      child: QuantityStepper(
                        quantity: item.quantity,
                        height: 40,
                        onIncrement: onIncrement,
                        onDecrement: onDecrement,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}