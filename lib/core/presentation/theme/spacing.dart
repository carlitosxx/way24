/// Utility class for managing consistent spacing in the app.
///
/// This class provides predefined constants for common spacing values
/// (e.g., small, medium, large) and helper methods for creating dynamic
/// spacing widgets like SizedBox for vertical and horizontal gaps.
///
/// Using this class ensures a unified design system for spacing throughout
/// the app, making it easier to maintain and update.
///
/// Examples:
/// ```dart
/// Padding(
///   padding: EdgeInsets.all(Spacing.spaceMedium);,
///   child: Text('Hello, World!'),
/// );
/// ```
class Spacing {
  /// space none = 0.0
  static const spaceZero = 0.0;

  /// space small = 8.0
  static const spaceSmall = 8.0;

  /// space medium = 16.0
  static const spaceMedium = 16.0;

  /// space large = 24.0
  static const spaceLarge = 24.0;

  /// space extra large = 32.0
  static const spaceExtraLarge = 32.0;

  /// space extra extra large = 40.0
  static const spaceExtraExtraLarge = 40.0;
}
