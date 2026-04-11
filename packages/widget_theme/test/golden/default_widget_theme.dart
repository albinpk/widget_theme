part of '../src/widget_theme/default_widget_theme.dart';

@immutable
class MyWidgetTheme extends ThemeExtension<MyWidgetTheme> with Diagnosticable {
  const MyWidgetTheme({this.foregroundColor, this.backgroundColor});

  final Color? foregroundColor;

  final Color? backgroundColor;

  @override
  MyWidgetTheme copyWith({Color? foregroundColor, Color? backgroundColor}) =>
      MyWidgetTheme(
        foregroundColor: foregroundColor ?? this.foregroundColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  @override
  MyWidgetTheme lerp(MyWidgetTheme? other, double t) {
    if (other is! MyWidgetTheme) return this;
    return MyWidgetTheme(
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
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

  // ignore: unused_element
  MyWidgetTheme _mergeWidget(MyWidget widget) => copyWith(
    foregroundColor: widget.foregroundColor,
    backgroundColor: widget.backgroundColor,
  );

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
        other.foregroundColor == foregroundColor &&
        other.backgroundColor == backgroundColor;
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, foregroundColor, backgroundColor);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Color>('foregroundColor', foregroundColor))
      ..add(DiagnosticsProperty<Color>('backgroundColor', backgroundColor));
  }
}

extension MyWidgetThemeBuildContextX on BuildContext {
  MyWidgetTheme get myWidgetTheme =>
      MyWidgetThemeThemeDataX(Theme.of(this)).myWidgetTheme;
}

extension MyWidgetThemeThemeDataX on ThemeData {
  MyWidgetTheme get myWidgetTheme => extension<MyWidgetTheme>()!;
}
