import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlyingItem extends StatefulWidget {
  final Rect from;
  final Rect to;
  final Widget child;
  final VoidCallback onCompleted;
  final Duration duration;

  const FlyingItem({
    super.key,
    required this.from,
    required this.to,
    required this.child,
    required this.onCompleted,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<FlyingItem> createState() => _FlyingItemState();
}

class _FlyingItemState extends State<FlyingItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) widget.onCompleted();
      })
      ..forward();
    _progress = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final start = widget.from.center;
    final end = widget.to.center;
    final control = Offset(
      (start.dx + end.dx) / 2,
      math.min(start.dy, end.dy) - 140,
    );
    final size = widget.from.size;

    return Stack(
      children: [
        AnimatedBuilder(
          animation: _progress,
          child: widget.child,
          builder: (context, child) {
            final t = _progress.value;
            final inverse = 1 - t;
            final dx = inverse * inverse * start.dx +
                2 * inverse * t * control.dx +
                t * t * end.dx;
            final dy = inverse * inverse * start.dy +
                2 * inverse * t * control.dy +
                t * t * end.dy;
            final scale = 1 - 0.82 * Curves.easeIn.transform(t);
            final opacity =
            t < 0.85 ? 1.0 : (1 - (t - 0.85) / 0.15).clamp(0.0, 1.0);

            return Positioned(
              left: dx - size.width / 2,
              top: dy - size.height / 2,
              width: size.width,
              height: size.height,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.rotate(
                    angle: t * 0.5,
                    child: Transform.scale(scale: scale, child: child),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}