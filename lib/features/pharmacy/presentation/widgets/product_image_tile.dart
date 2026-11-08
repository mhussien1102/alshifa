import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import 'product_bottle.dart';

class ProductImageTile extends StatelessWidget {
  final ProductColorScheme scheme;
  final double width;
  final double height;

  const ProductImageTile({
    super.key,
    required this.scheme,
    this.width = double.infinity,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: scheme.background,
        borderRadius: BorderRadius.circular(AppSizes.radiusField),
      ),
      child: ProductBottle(scheme: scheme, height: height * 0.575),
    );
  }
}