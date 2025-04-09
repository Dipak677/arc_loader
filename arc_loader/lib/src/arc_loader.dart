import 'package:arc_loader/src/arc_painter.dart';
import 'package:flutter/material.dart';

import 'arc_style.dart';
import 'arc_speed.dart';

/// A customizable animated arc-based loader widget for Flutter.
///
/// The [ArcLoader] displays animated rotating arcs, which can be styled and colored
/// based on your preferences. It supports simple or complete arc styles, different
/// animation speeds, and adjustable layout parameters like width and spacing.
class ArcLoader extends StatefulWidget {
  /// List of colors to apply to each arc segment.
  final List<Color> arcColors;

  /// The stroke width of each arc.
  final double arcWidth;

  /// The margin between the arc and the edge of the widget.
  final double arcMargin;

  /// The gap between the outer and inner arcs (used in [ArcStyle.completeArc]).
  final double innerGap;

  /// Defines the speed of the arc rotation animation.
  final ArcSpeed speed;

  /// Defines the visual style of the arc (simple or complete).
  final ArcStyle style;

  /// Creates an [ArcLoader] widget.
  ///
  /// The [arcColors] parameter must not be null and should contain at least one color.
  const ArcLoader({
    super.key,
    required this.arcColors,
    this.arcWidth = 8.0,
    this.arcMargin = 6.0,
    this.innerGap = 3.0,
    this.speed = ArcSpeed.medium,
    this.style = ArcStyle.simpleArc,
  });

  @override
  State<ArcLoader> createState() => _ArcLoaderState();
}

class _ArcLoaderState extends State<ArcLoader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final double rotationDuration;

  @override
  void initState() {
    super.initState();

    rotationDuration = switch (widget.speed) {
      ArcSpeed.slow => 4.0,
      ArcSpeed.medium => 2.0,
      ArcSpeed.fast => 1.0,
    };

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: rotationDuration.toInt()),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => CustomPaint(
        painter: ArcPainter(
          progress: _controller.value,
          arcColors: widget.arcColors,
          arcWidth: widget.arcWidth,
          arcMargin: widget.arcMargin,
          innerGap: widget.innerGap,
          style: widget.style,
        ),
      ),
    );
  }
}
