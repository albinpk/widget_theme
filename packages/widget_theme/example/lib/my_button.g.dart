// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_button.dart';

// **************************************************************************
// WidgetThemeGenerator
// **************************************************************************

@immutable
class MyButtonTheme extends ThemeExtension<MyButtonTheme> with Diagnosticable {
  const MyButtonTheme({
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.margin,
  });

  final TextStyle? textStyle;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  @override
  MyButtonTheme copyWith({
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) => MyButtonTheme(
    textStyle: textStyle ?? this.textStyle,
    backgroundColor: backgroundColor ?? this.backgroundColor,
    foregroundColor: foregroundColor ?? this.foregroundColor,
    padding: padding ?? this.padding,
    margin: margin ?? this.margin,
  );

  @override
  MyButtonTheme lerp(MyButtonTheme? other, double t) {
    if (other is! MyButtonTheme) return this;
    return MyButtonTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      margin: EdgeInsetsGeometry.lerp(margin, other.margin, t),
    );
  }

  static MyButtonTheme? maybeOf(BuildContext context) =>
      Theme.of(context).extension<MyButtonTheme>();

  static MyButtonTheme of(BuildContext context) {
    final data = maybeOf(context);
    if (data == null) {
      throw FlutterError('No MyButtonTheme found in the widget tree');
    }
    return data;
  }

  MyButtonTheme _mergeWidget(MyButton widget) {
    return copyWith(
      textStyle: widget.textStyle,
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      padding: widget.padding,
      margin: widget.margin,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is MyButtonTheme &&
        other.textStyle == textStyle &&
        other.backgroundColor == backgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.padding == padding &&
        other.margin == margin;
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    textStyle,
    backgroundColor,
    foregroundColor,
    padding,
    margin,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<TextStyle>('textStyle', textStyle))
      ..add(DiagnosticsProperty<Color>('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty<Color>('foregroundColor', foregroundColor))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin));
  }
}

extension MyButtonThemeBuildContextX on BuildContext {
  MyButtonTheme get myButtonTheme =>
      MyButtonThemeThemeDataX(Theme.of(this)).myButtonTheme;
}

extension MyButtonThemeThemeDataX on ThemeData {
  MyButtonTheme get myButtonTheme => extension<MyButtonTheme>()!;
}
