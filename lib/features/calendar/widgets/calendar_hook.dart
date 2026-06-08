import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// The rounded plastic hook/hanger used to hang a physical wall calendar.
///
/// Rendered as a glossy plastic loop (an outer rounded body with a punched-out
/// hole) sitting above the calendar sheet, casting a soft shadow onto it.
class CalendarHook extends StatelessWidget {
  const CalendarHook({
    super.key,
    this.width = 58,
    this.height = 34,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _HookPainter(),
      ),
    );
  }
}

class _HookPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bodyRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(size.height / 2),
    );

    // Soft shadow cast by the plastic onto the paper below.
    canvas.drawRRect(
      bodyRect.shift(const Offset(0, 3)),
      Paint()
        ..color = Colors.black.withValues(alpha: 0.18)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );

    // Plastic body with a vertical gloss gradient.
    final bodyPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white, AppColors.hook, AppColors.hookShade],
        stops: [0.0, 0.55, 1.0],
      ).createShader(Offset.zero & size);
    canvas.drawRRect(bodyRect, bodyPaint);

    // Subtle outline for definition.
    canvas.drawRRect(
      bodyRect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = AppColors.hookShade.withValues(alpha: 0.6),
    );

    // Punched-out hole in the middle of the loop.
    final holeWidth = size.width * 0.46;
    final holeHeight = size.height * 0.4;
    final holeRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.52),
        width: holeWidth,
        height: holeHeight,
      ),
      Radius.circular(holeHeight / 2),
    );
    canvas.drawRRect(holeRect, Paint()..color = AppColors.wall);
    // Inner shadow on the hole's top edge for depth.
    canvas.drawRRect(
      holeRect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..color = Colors.black.withValues(alpha: 0.12),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
