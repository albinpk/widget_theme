import 'package:meta/meta_meta.dart';

/// Annotation used to trigger code generation for a widget theme.
@Target({.classType})
class WidgetTheme {
  /// Creates a [WidgetTheme] annotation.
  const WidgetTheme({
    this.themeDataExtension,
    this.buildContextExtension,
    this.equals,
    this.diagnosticable,
    this.overrideWithHelper,
    this.mergeWidgetHelper,
    this.staticAccessor,
    this.name,
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
}

/// Annotation instance of [WidgetTheme].
const widgetTheme = WidgetTheme();
