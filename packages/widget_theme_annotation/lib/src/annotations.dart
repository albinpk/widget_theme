import 'package:meta/meta_meta.dart';

/// Annotation used to trigger code generation for a widget theme.
@Target({.classType})
class WidgetTheme {
  /// Creates a [WidgetTheme] annotation.
  const WidgetTheme();
}

/// Annotation instance of [WidgetTheme].
const widgetTheme = WidgetTheme();
