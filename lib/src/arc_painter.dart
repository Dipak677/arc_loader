import 'dart:math';

import 'package:arc_loader/src/arc_style.dart';
import 'package:flutter/material.dart';

/// A custom painter that draws animated rotating arcs based on the given style.
///
/// [ArcPainter] handles both simple and complete arc styles, allowing for layered
/// animated arc effects with configurable appearance such as stroke width, margin,
/// color, and animation progress.
class ArcPainter extends CustomPainter {
  /// The current animation progress, typically a value from 0.0 to 1.0.
  final double progress;

  /// A list of colors for each arc segment (up to 4 supported).
  final List<Color> arcColors;

  /// The width of each arc stroke.
  final double arcWidth;

  /// The margin between the outermost arc and the widget boundary.
  final double arcMargin;

  /// The gap between the outer and inner arcs (only used in [ArcStyle.completeArc]).
  final double innerGap;

  /// The visual style of the arcs (simple or complete).
  final ArcStyle style;

  /// Creates an [ArcPainter] with configurable visual and animation properties.
  ArcPainter({
    required this.progress,
    required this.arcColors,
    required this.arcWidth,
    required this.arcMargin,
    required this.innerGap,
    required this.style,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = arcWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final center = size.center(Offset.zero);
    final outerRadius = (min(size.width, size.height) / 2) - arcMargin;

    // Radius of the inner arc (used for ArcStyle.completeArc)
    final innerRadius = outerRadius - arcWidth - innerGap;

    final outerRect = Rect.fromCircle(center: center, radius: outerRadius);
    final innerRect = Rect.fromCircle(center: center, radius: innerRadius);

    // Rotational offset for animation
    final rotation = progress * 2 * pi;
    final count = arcColors.length.clamp(1, 4);

    for (int i = 0; i < count; i++) {
      paint.color = arcColors[i];

      final startAngle = (pi / 2 * i) + rotation;
      const sweepAngle = pi / 2;

      if (style == ArcStyle.simpleArc) {
        canvas.drawArc(outerRect, startAngle, sweepAngle, false, paint);
      } else {
        canvas.drawArc(outerRect, startAngle, sweepAngle, false, paint);
        canvas.drawArc(innerRect, -startAngle, sweepAngle, false, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant ArcPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.arcColors != arcColors ||
      oldDelegate.arcWidth != arcWidth ||
      oldDelegate.arcMargin != arcMargin ||
      oldDelegate.innerGap != innerGap ||
      oldDelegate.style != style;
}