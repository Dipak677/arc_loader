/// Defines the rotation speed for the [ArcLoader] animation.
///
/// This controls how fast the arc rotates:
/// - [ArcSpeed.slow]   → Slower rotation (e.g., 4 seconds per cycle)
/// - [ArcSpeed.medium] → Medium speed rotation (default)
/// - [ArcSpeed.fast]   → Faster rotation (e.g., 1 second per cycle)
enum ArcSpeed {
  /// Slow rotation speed.
  slow,

  /// Medium/default rotation speed.
  medium,

  /// Fast rotation speed.
  fast,
}
