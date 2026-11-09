import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_back_button.dart';
import '../utils/pharmacy_actions.dart';
import 'cart_badge_button.dart';

class ProductDetailsHeader extends StatelessWidget {
  final int cartCount;
  final int bumpCount;
  final GlobalKey cartKey;

  const ProductDetailsHeader({
    super.key,
    required this.cartCount,
    required this.bumpCount,
    required this.cartKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppBackButton(),
        const SizedBox(width: AppSizes.md),
        Text(
          'تفاصيل المنتج',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: 22),
        ),
        const Spacer(),
        CartBadgeButton(
          key: cartKey,
          count: cartCount,
          bumpCount: bumpCount,
          filled: false,
          size: AppSizes.backButton,
          onPressed: () => openCart(context),
        ),
      ],
    );
  }
}