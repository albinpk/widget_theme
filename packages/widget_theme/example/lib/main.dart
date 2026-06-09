import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

part 'main.g.dart';

const List<ThemeField<Object?>> fields = [
  ThemeField<bool?>('readOnly'),
  ThemeField<Color?>('color'),
];

@WidgetTheme(fields: fields)
class MyWidget extends StatelessWidget {
  const MyWidget({
    this.padding,
    this.color,
    this.readOnly,
    super.key,
  });

  final Color? color;
  final EdgeInsets? padding;
  @themeInclude
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    final theme = MyWidgetTheme.of(context)._mergeWidget(this);

    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        'Hello world!',
        style: TextStyle(
          // color: theme.color,
        ),
      ),
    );
  }
}

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: const [
          MyWidgetTheme(
            color: Colors.red,
            readOnly: false,
          ),
        ],
      ),
      home: const Scaffold(
        body: Center(child: MyWidget()),
      ),
    );
  }
}
