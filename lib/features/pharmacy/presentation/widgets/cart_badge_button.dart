import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/formaters.dart';

class CartBadgeButton extends StatefulWidget {
  final int count;
  final int bumpCount;
  final VoidCallback onPressed;

  const CartBadgeButton({
    super.key,
    required this.count,
    required this.bumpCount,
    required this.onPressed,
  });

  @override
  State<CartBadgeButton> createState() => _CartBadgeButtonState();
}

class _CartBadgeButtonState extends State<CartBadgeButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 450),
  );

  late final Animation<double> _scale = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween(begin: 1.0, end: 1.3).chain(CurveTween(curve: Curves.easeOut)),
      weight: 35,
    ),
    TweenSequenceItem(
      tween: Tween(begin: 1.3, end: 1.0)
          .chain(CurveTween(curve: Curves.elasticOut)),
      weight: 65,
    ),
  ]).animate(_controller);

  @override
  void didUpdateWidget(covariant CartBadgeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.bumpCount != oldWidget.bumpCount) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            color: AppColors.primary,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: widget.onPressed,
              child: const SizedBox(
                width: AppSizes.cartButton,
                height: AppSizes.cartButton,
                child: Icon(
                  LucideIcons.shoppingCart,
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (widget.count > 0)
            Positioned(
              left: -2,
              top: -2,
              child: Container(
                constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(AppSizes.radiusPill),
                ),
                child: Text(
                  Formatters.digits(widget.count),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}