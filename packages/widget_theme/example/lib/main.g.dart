// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// WidgetThemeGenerator
// **************************************************************************

/// Theme data for [MyWidget].
///
/// Generated from fields in [MyWidget] annotated with `@WidgetTheme`.
///
/// This theme is implemented as a [ThemeExtension] and can be added to
/// [ThemeData.extensions].
///
/// Example:
///
/// ```dart
/// ThemeData(
///   extensions: [
///     const MyWidgetTheme(
///       // ...
///     ),
///   ],
/// )
/// ```
@immutable
class MyWidgetTheme extends ThemeExtension<MyWidgetTheme> with Diagnosticable {
  /// Create instance of [MyWidgetTheme].
  const MyWidgetTheme({this.color, this.padding});

  final Color? color;

  final EdgeInsets? padding;

  @override
  MyWidgetTheme copyWith({Color? color, EdgeInsets? padding}) => MyWidgetTheme(
    color: color ?? this.color,
    padding: padding ?? this.padding,
  );

  @override
  MyWidgetTheme lerp(MyWidgetTheme? other, double t) {
    if (other is! MyWidgetTheme) return this;
    return MyWidgetTheme(
      color: Color.lerp(color, other.color, t),
      padding: EdgeInsets.lerp(padding, other.padding, t),
    );
  }

  /// Returns the nearest [MyWidgetTheme] in the widget tree.
  ///
  /// Returns `null` if no theme is found.
  static MyWidgetTheme? maybeOf(BuildContext context) =>
      Theme.of(context).extension<MyWidgetTheme>();

  /// Returns the nearest [MyWidgetTheme] in the widget tree.
  ///
  /// Throws a [FlutterError] if no theme is found.
  static MyWidgetTheme of(BuildContext context) {
    final data = maybeOf(context);
    if (data == null) {
      throw FlutterError('No MyWidgetTheme found in the widget tree');
    }
    return data;
  }

  /// Merges widget properties with this theme.
  ///
  /// Non-null widget values override themed values.
  // ignore: unused_element
  MyWidgetTheme _mergeWidget(MyWidget widget) =>
      copyWith(color: widget.color, padding: widget.padding);

  /// Overrides the current [MyWidgetTheme] for the given subtree.
  ///
  /// This creates a scoped theme override using Flutter's theme system.
  static Widget overrideWith({
    required MyWidgetTheme data,
    required Widget child,
  }) => Builder(
    builder: (context) => Theme(
      data: Theme.of(context).copyWith(extensions: [data]),
      child: child,
    ),
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is MyWidgetTheme &&
        other.color == color &&
        other.padding == padding;
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, padding);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Color>('color', color))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding));
  }
}

/// Extension for accessing [MyWidgetTheme] from [BuildContext].
extension MyWidgetThemeBuildContextX on BuildContext {
  /// Returns the current [MyWidgetTheme].
  MyWidgetTheme get myWidgetTheme => Theme.of(this).extension<MyWidgetTheme>()!;
}

/// Extension for accessing [MyWidgetTheme] from [ThemeData].
extension MyWidgetThemeThemeDataX on ThemeData {
  /// Returns the registered [MyWidgetTheme].
  MyWidgetTheme get myWidgetTheme => extension<MyWidgetTheme>()!;
}
