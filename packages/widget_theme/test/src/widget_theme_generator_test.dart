import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:widget_theme/widget_theme.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

Future<void> main() async {
  initializeBuildLogTracking();

  final defaultReader = await initializeLibraryReaderForDirectory(
    'test/src/widget_theme',
    'default_widget_theme.dart',
  );

  group('WidgetThemeGenerator', () {
    testAnnotatedElements<WidgetTheme>(
      defaultReader,
      const WidgetThemeGenerator(options: .empty),
    );
  });

  clearBuildLog();
}
