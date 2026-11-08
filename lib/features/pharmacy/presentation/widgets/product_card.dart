import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/formaters.dart';
import '../../../../core/utils/render_utils.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/quantity_stepper.dart';
import '../../domain/entities/product.dart';
import 'product_image_tile.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final int quantity;
  final ValueChanged<Rect?> onAdd;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAdd,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final _imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final product = widget.product;
    final scheme = ProductColorScheme.values.byName(product.color.name);

    return Container(
      padding: const EdgeInsets.all(AppSizes.screenPadding / 2),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageTile(key: _imageKey, scheme: scheme),
          const SizedBox(height: AppSizes.sm),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            product.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(fontSize: 13, height: 1.5),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            Formatters.price(product.price),
            style: textTheme.titleMedium?.copyWith(
              fontSize: 18,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          if (widget.quantity == 0)
            CustomButton(
              text: 'أضف إلى العربة',
              height: 44,
              onPressed: () => widget.onAdd(globalRectOf(_imageKey)),
            )
          else
            QuantityStepper(
              quantity: widget.quantity,
              onIncrement: widget.onIncrement,
              onDecrement: widget.onDecrement,
            ),
        ],
      ),
    );
  }
}