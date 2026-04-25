import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

part 'my_button.g.dart';

@WidgetTheme(
  // name: 'MyTheme',
  // staticAccessor: false,
  // mergeWidgetHelper: false,
  // overrideWithHelper: false,
  // diagnosticable: false,
  // equals: false,
  // buildContextExtension: false,
  // themeDataExtension: false,
)
class MyButton extends StatelessWidget {
  const MyButton({
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.margin,
    super.key,
  });

  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = MyButtonTheme.of(context)._mergeWidget(this);

    return Padding(
      padding: theme.margin ?? .zero,
      child: InkWell(
        child: Container(
          padding: theme.padding,
          color: theme.backgroundColor,
          child: Text(
            'Click Me',
            style: theme.textStyle ?? TextStyle(color: theme.foregroundColor),
          ),
        ),
      ),
    );
  }
}
