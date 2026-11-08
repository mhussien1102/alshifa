import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../domain/entities/product.dart';
import 'product_card.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;
  final Map<String, int> quantities;
  final void Function(Product product, Rect? from) onAdd;
  final ValueChanged<String> onIncrement;
  final ValueChanged<String> onDecrement;

  const ProductsGrid({
    super.key,
    required this.products,
    required this.quantities,
    required this.onAdd,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(
        AppSizes.screenPadding,
        0,
        AppSizes.screenPadding,
        AppSizes.lg,
      ),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSizes.md,
        crossAxisSpacing: AppSizes.md,
        mainAxisExtent: AppSizes.productCardHeight,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          key: ValueKey(product.id),
          product: product,
          quantity: quantities[product.id] ?? 0,
          onAdd: (from) => onAdd(product, from),
          onIncrement: () => onIncrement(product.id),
          onDecrement: () => onDecrement(product.id),
        );
      },
    );
  }
}