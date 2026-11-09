import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import '../widgets/product_details_view.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ProductDetailsView(product: product),
      ),
    );
  }
}