import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// A very subtle off-white "painted wall" texture.
///
/// Draws a soft vertical gradient plus a sparse, deterministic speckle pattern
/// so the background reads as hand-painted plaster instead of a flat fill.
/// Rendering is cheap and seeded, so it stays stable across rebuilds.
class PaintTexture extends StatelessWidget {
  const PaintTexture({
    super.key,
    this.baseColor = AppColors.wall,
    this.shadeColor = AppColors.wallShade,
    this.child,
  });

  final Color baseColor;
  final Color shadeColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PaintTexturePainter(baseColor: baseColor, shadeColor: shadeColor),
      child: child,
    );
  }
}

class _PaintTexturePainter extends CustomPainter {
  _PaintTexturePainter({required this.baseColor, required this.shadeColor});

  final Color baseColor;
  final Color shadeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Soft diagonal gradient to suggest uneven lighting on the wall.
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [baseColor, shadeColor],
    );
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));

    // Sparse speckles for a faint paint-roller texture. Seeded => stable.
    final random = Random(42);
    final speckle = Paint()..style = PaintingStyle.fill;
    final count = (size.width * size.height / 900).clamp(0, 4000).toInt();
    for (var i = 0; i < count; i++) {
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      final lighten = random.nextBool();
      // Extremely low alpha so the texture is only perceptible, never busy.
      speckle.color = (lighten ? Colors.white : AppColors.wallShade)
          .withValues(alpha: lighten ? 0.05 : 0.04);
      canvas.drawCircle(Offset(dx, dy), random.nextDouble() * 1.1 + 0.3, speckle);
    }
  }

  @override
  bool shouldRepaint(covariant _PaintTexturePainter oldDelegate) {
    return oldDelegate.baseColor != baseColor || oldDelegate.shadeColor != shadeColor;
  }
}
