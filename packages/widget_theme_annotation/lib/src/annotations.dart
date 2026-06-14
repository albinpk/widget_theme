import 'package:meta/meta_meta.dart';

/// Annotation used to trigger code generation for a widget theme.
@Target({.classType})
class WidgetThemeExtension {
  /// Creates a [WidgetTheme] annotation.
  const WidgetThemeExtension({
    this.name,
    this.staticAccessor,
    this.mergeWidgetHelper,
    this.overrideWithHelper,
    this.diagnosticable,
    this.equals,
    this.buildContextExtension,
    this.themeDataExtension,
    this.docs,
    this.fields = const [],
  });

  /// Name of the theme extension.
  /// By default, widget name + 'Theme'.
  final String? name;

  /// Whether to generate static helper methods `of` and `maybeOf`
  /// for the theme extension. Default is true.
  final bool? staticAccessor;

  /// Whether to generate merge helper method `_mergeWidget`.
  /// Default is true.
  final bool? mergeWidgetHelper;

  /// Whether to generate override helper method `overrideWith`.
  /// Default is true.
  final bool? overrideWithHelper;

  /// Whether to make the theme extension mixin `Diagnosticable`.
  /// Default is true.
  final bool? diagnosticable;

  /// Whether to generate equals method `==`.
  /// This will also generate `hashCode`.
  /// Default is true.
  final bool? equals;

  /// Whether to generate a extension on BuildContext that provides the theme.
  /// Default is true.
  final bool? buildContextExtension;

  /// Whether to generate a extension on ThemeData that provides the theme.
  /// Default is true.
  final bool? themeDataExtension;

  /// Whether to generate documentation.
  /// Default is true.
  final bool? docs;

  /// Additional fields to include in the generated theme.
  ///
  /// These fields are generated alongside fields inferred from the widget's
  /// properties. This is useful for theme-only configuration that is not
  /// represented by a widget field.
  final List<ThemeField<dynamic>> fields;
}

const widgetThemeExtension = WidgetThemeExtension();

/// Annotation used to trigger code generation for a widget theme.
@Target({.classType})
class WidgetTheme {
  /// Creates a [WidgetTheme] annotation.
  const WidgetTheme({
    this.name,
    this.staticAccessor,
    this.mergeWidgetHelper,
    this.overrideWithHelper,
    this.diagnosticable,
    this.equals,
    this.buildContextExtension,
    this.themeDataExtension,
    this.docs,
    this.fields = const [],
  });

  /// Name of the theme extension.
  /// By default, widget name + 'Theme'.
  final String? name;

  /// Whether to generate static helper methods `of` and `maybeOf`
  /// for the theme extension. Default is true.
  final bool? staticAccessor;

  /// Whether to generate merge helper method `_mergeWidget`.
  /// Default is true.
  final bool? mergeWidgetHelper;

  /// Whether to generate override helper method `overrideWith`.
  /// Default is true.
  final bool? overrideWithHelper;

  /// Whether to make the theme extension mixin `Diagnosticable`.
  /// Default is true.
  final bool? diagnosticable;

  /// Whether to generate equals method `==`.
  /// This will also generate `hashCode`.
  /// Default is true.
  final bool? equals;

  /// Whether to generate a extension on BuildContext that provides the theme.
  /// Default is true.
  final bool? buildContextExtension;

  /// Whether to generate a extension on ThemeData that provides the theme.
  /// Default is true.
  final bool? themeDataExtension;

  /// Whether to generate documentation.
  /// Default is true.
  final bool? docs;

  /// Additional fields to include in the generated theme.
  ///
  /// These fields are generated alongside fields inferred from the widget's
  /// properties. This is useful for theme-only configuration that is not
  /// represented by a widget field.
  final List<ThemeField<dynamic>> fields;
}

/// Annotation instance of [WidgetTheme].
const widgetTheme = WidgetTheme();

/// Defines an additional field to generate in the theme.
///
/// The generated field is not required to exist on the widget itself,
/// allowing theme-only configuration to be added to the generated
/// `ThemeExtension`.
class ThemeField<T> {
  /// Creates a [ThemeField].
  const ThemeField(this.name, {this.lerp});

  /// Name of the generated theme field.
  ///
  /// For example:
  ///
  /// ```dart
  /// ThemeField<Color?>(#hoverColor)
  /// ```
  ///
  /// generates:
  ///
  /// ```dart
  /// final Color? hoverColor;
  /// ```
  final Symbol name;

  /// Custom interpolation function used by the generated `lerp` method.
  ///
  /// If omitted, the generator will use a built-in lerp implementation when
  /// available for the field type. Otherwise, values will snap between
  /// instances based on the interpolation factor.
  final LerpFn<T>? lerp;
}

/// Annotation to exclude a field from the theme.
@Target({.field})
class ThemeExclude {
  const ThemeExclude();
}

/// Annotation instance of [ThemeExclude].
const themeExclude = ThemeExclude();

/// Annotation to include a field in the theme.
@Target({.field})
class ThemeInclude<T extends Object> {
  const ThemeInclude({this.lerp});

  /// Custom lerp function for the theme field.
  ///
  /// By default, the generated `lerp` method will simply snap between the
  /// values at `t < 0.5` rather than smoothly interpolating.
  final LerpFn<T>? lerp;
}

/// Annotation instance of [ThemeInclude].
const ThemeInclude<Object> themeInclude = ThemeInclude();

/// Custom lerp function used by the generated `lerp` method.
typedef LerpFn<T> = T? Function(T? a, T? b, double t);
