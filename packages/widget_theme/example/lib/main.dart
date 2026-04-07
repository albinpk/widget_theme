import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

part 'main.g.dart';

@widgetTheme
class MyWidget extends StatelessWidget {
  const MyWidget({
    this.padding,
    this.color,
    super.key,
  });

  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = MyWidgetTheme.of(context)._mergeWidget(this);

    return Padding(
      padding: theme.padding ?? const EdgeInsets.all(8),
      child: Text(
        'Hello world!',
        style: TextStyle(color: theme.color),
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
          MyWidgetTheme(color: Colors.red),
        ],
      ),
      home: const Scaffold(
        body: Center(child: MyWidget()),
      ),
    );
  }
}
