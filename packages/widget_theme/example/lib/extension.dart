import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

part 'extension.g.dart';

@widgetThemeExtension
abstract class Shared extends ThemeExtension<Shared> with _$Shared {
  const factory Shared({
    int? wow,
    double? elevation,
  }) = _Shared;
}

@WidgetTheme(docs: false)
class One extends StatelessWidget {
  const One({this.shared, this.color, super.key});

  final Color? color;
  @themeInclude
  final Shared? shared;

  @override
  Widget build(BuildContext context) => const Text('mine');
}

@WidgetTheme(docs: false)
class Two extends StatelessWidget {
  const Two({this.color, super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const Text('mine');
  }
}
