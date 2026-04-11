import 'package:flutter_test/flutter_test.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

void main() {
  group('WidgetTheme annotation', () {
    test('annotation instance', () async {
      expect(const WidgetTheme(), equals(widgetTheme));
    });
  });
}
