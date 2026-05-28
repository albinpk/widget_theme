part of '../src/widget_theme/default_widget_theme.dart';

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
  const MyWidgetTheme({this.foregroundColor, this.backgroundColor, this.onTap});

  final Color? foregroundColor;

  final Color? backgroundColor;

  final void Function()? onTap;

  @override
  MyWidgetTheme copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
    void Function()? onTap,
  }) => MyWidgetTheme(
    foregroundColor: foregroundColor ?? this.foregroundColor,
    backgroundColor: backgroundColor ?? this.backgroundColor,
    onTap: onTap ?? this.onTap,
  );

  @override
  MyWidgetTheme lerp(MyWidgetTheme? other, double t) {
    if (other is! MyWidgetTheme) return this;
    return MyWidgetTheme(
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      onTap: t < 0.5 ? onTap : other.onTap,
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
  MyWidgetTheme _mergeWidget(MyWidget widget) => copyWith(
    foregroundColor: widget.foregroundColor,
    backgroundColor: widget.backgroundColor,
    onTap: widget.onTap,
  );

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
        other.foregroundColor == foregroundColor &&
        other.backgroundColor == backgroundColor &&
        other.onTap == onTap;
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, foregroundColor, backgroundColor, onTap);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Color>('foregroundColor', foregroundColor))
      ..add(DiagnosticsProperty<Color>('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty<void Function()>('onTap', onTap));
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
