import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

part '../../golden/default_widget_theme.dart';

@widgetTheme
@ShouldGenerateFile(
  '../../golden/default_widget_theme.dart',
  partOfCurrent: true,
)
class MyWidget extends StatelessWidget {
  const MyWidget({this.foregroundColor, this.backgroundColor, super.key});

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return const Text('Hello World');
  }
}
