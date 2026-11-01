import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';

class SplashLoadingBar extends StatefulWidget {
  final VoidCallback onCompleted;
  final Duration duration;

  const SplashLoadingBar({
    super.key,
    required this.onCompleted,
    this.duration = const Duration(milliseconds: 2500),
  });

  @override
  State<SplashLoadingBar> createState() => _SplashLoadingBarState();
}

class _SplashLoadingBarState extends State<SplashLoadingBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) widget.onCompleted();
      })
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppSizes.loadingBarWidth,
          height: AppSizes.loadingBarHeight,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(AppSizes.radiusPill),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                width: AppSizes.loadingBarWidth * _controller.value,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(AppSizes.radiusPill),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.lg),
        Text(
          'جارٍ التحميل',
          style: textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}