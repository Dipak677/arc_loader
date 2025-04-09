/// Defines the visual style for the [ArcLoader] arcs.
///
/// - [ArcStyle.simpleArc]   → Draws only the outer arcs.
/// - [ArcStyle.completeArc] → Draws both outer and inner arcs for a layered effect.
enum ArcStyle {
  /// Displays only the outer arc segments.
  simpleArc,

  /// Displays both outer and inner arc segments.
  completeArc,
}