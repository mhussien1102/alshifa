import 'package:flutter/material.dart';

class SplashRings extends StatelessWidget {
  const SplashRings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _RingsPainter());
  }
}

class _RingsPainter extends CustomPainter {
  static const _designWidth = 390.0; // عرض التصميم الأصلي
  static const _radii = [150.0, 235.0, 325.0];

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / _designWidth;
    final center = Offset(size.width / 2, size.height * 0.456);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.white.withValues(alpha: 0.07);

    for (final r in _radii) {
      canvas.drawCircle(center, r * scale, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}