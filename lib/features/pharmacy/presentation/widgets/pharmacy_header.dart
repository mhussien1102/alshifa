import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_circle_button.dart';
import '../utils/pharmacy_actions.dart';
import 'cart_badge_button.dart';

class PharmacyHeader extends StatelessWidget {
  final int cartCount;
  final int bumpCount;
  final GlobalKey cartKey;

  const PharmacyHeader({
    super.key,
    required this.cartCount,
    required this.bumpCount,
    required this.cartKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartBadgeButton(
          key: cartKey,
          count: cartCount,
          bumpCount: bumpCount,
          onPressed: () => openCart(context),
        ),
        const SizedBox(width: AppSizes.md),
        Text('الأدوية', style: Theme.of(context).textTheme.headlineMedium),
        const Spacer(),
        const AppCircleButton(icon: LucideIcons.menu),
      ],
    );
  }
}