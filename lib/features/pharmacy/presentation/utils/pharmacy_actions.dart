import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/fly_animation.dart';
import '../../../../core/utils/render_utils.dart';
import '../../domain/entities/product.dart';
import '../widgets/product_image_tile.dart';

void openCart(BuildContext context) {
  context.push(AppRoutes.cart);
}

void flyProductToCart({
  required BuildContext context,
  required Product product,
  required Rect? from,
  required GlobalKey cartKey,
  required VoidCallback onLanded,
}) {
  if (from == null) return;
  final to = globalRectOf(cartKey);
  if (to == null) {
    onLanded();
    return;
  }

  flyToTarget(
    context: context,
    from: from,
    to: to,
    onLanded: onLanded,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusField),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ProductImageTile(
        scheme: ProductColorScheme.values.byName(product.color.name),
        width: from.width,
        height: from.height,
      ),
    ),
  );
}