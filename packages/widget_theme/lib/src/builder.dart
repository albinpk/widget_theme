import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_theme/widget_theme.dart';

/// Builder entry point.
Builder widgetThemeBuilder(BuilderOptions options) => PartBuilder(
  [WidgetThemeGenerator(options: options)],
  '.theme.dart',
);
