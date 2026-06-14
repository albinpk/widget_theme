import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_theme/src/widget_theme_extension_generator.dart';
import 'package:widget_theme/widget_theme.dart';

/// Builder entry point.
Builder widgetThemeBuilder(BuilderOptions options) => SharedPartBuilder(
  [WidgetThemeGenerator(options: options)],
  'theme',
);

Builder widgetThemeExtensionBuilder(BuilderOptions options) =>
    SharedPartBuilder(
      [WidgetThemeExtensionGenerator(options: options)],
      'extension',
    );
