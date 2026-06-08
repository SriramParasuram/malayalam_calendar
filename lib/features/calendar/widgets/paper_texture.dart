import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Soft, off-white "paper" texture for the calendar sheet background.
///
/// Combines a gentle radial warmth (as if lit from the front) with faint fibre
/// flecks so the surface reads as aged paper. Seeded for stable rebuilds.
class PaperTexture extends StatelessWidget {
  const PaperTexture({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PaperTexturePainter(),
      child: child,
    );
  }
}

class _PaperTexturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Warm base with a subtle radial highlight toward the top.
    final radial = RadialGradient(
      center: const Alignment(0, -0.5),
      radius: 1.1,
      colors: const [AppColors.paper, AppColors.paperShade],
    );
    canvas.drawRect(rect, Paint()..shader = radial.createShader(rect));

    // Faint paper fibres / flecks.
    final random = Random(7);
    final fleck = Paint()..style = PaintingStyle.fill;
    final count = (size.width * size.height / 1400).clamp(0, 3000).toInt();
    for (var i = 0; i < count; i++) {
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      final darken = random.nextBool();
      fleck.color = (darken ? AppColors.paperEdge : Colors.white)
          .withValues(alpha: darken ? 0.05 : 0.06);
      canvas.drawCircle(Offset(dx, dy), random.nextDouble() * 0.9 + 0.2, fleck);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
