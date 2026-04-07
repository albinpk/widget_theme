// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// WidgetThemeGenerator
// **************************************************************************

@immutable
class MyWidgetTheme extends ThemeExtension<MyWidgetTheme> with Diagnosticable {
  const MyWidgetTheme({this.color, this.padding});

  final Color? color;

  final EdgeInsets? padding;

  @override
  MyWidgetTheme copyWith({Color? color, EdgeInsets? padding}) => MyWidgetTheme(
    color: color ?? this.color,
    padding: padding ?? this.padding,
  );

  @override
  MyWidgetTheme lerp(MyWidgetTheme? other, double t) {
    if (other is! MyWidgetTheme) return this;
    return MyWidgetTheme(
      color: Color.lerp(color, other.color, t),
      padding: EdgeInsets.lerp(padding, other.padding, t),
    );
  }

  static MyWidgetTheme? maybeOf(BuildContext context) =>
      Theme.of(context).extension<MyWidgetTheme>();

  static MyWidgetTheme of(BuildContext context) {
    final data = maybeOf(context);
    if (data == null) {
      throw FlutterError('No MyWidgetTheme found in the widget tree');
    }
    return data;
  }

  MyWidgetTheme _mergeWidget(MyWidget widget) =>
      copyWith(color: widget.color, padding: widget.padding);

  static Widget overrideWith({
    required MyWidgetTheme data,
    required Widget child,
  }) => Builder(
    builder: (context) => Theme(
      data: Theme.of(context).copyWith(extensions: [data]),
      child: child,
    ),
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is MyWidgetTheme &&
        other.color == color &&
        other.padding == padding;
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, padding);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Color>('color', color))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding));
  }
}

extension MyWidgetThemeBuildContextX on BuildContext {
  MyWidgetTheme get myWidgetTheme =>
      MyWidgetThemeThemeDataX(Theme.of(this)).myWidgetTheme;
}

extension MyWidgetThemeThemeDataX on ThemeData {
  MyWidgetTheme get myWidgetTheme => extension<MyWidgetTheme>()!;
}
