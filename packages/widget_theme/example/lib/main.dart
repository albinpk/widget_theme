import 'package:flutter/material.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

part 'main.freezed.dart';
part 'main.theme.dart';

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
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: Text('Hello world!', style: TextStyle(color: color)),
    );
  }
}

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: MyWidget()),
      ),
    );
  }
}
