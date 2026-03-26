// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'main.dart';

// **************************************************************************
// WidgetThemeGenerator
// **************************************************************************

// ignore_for_file: unreachable_from_main

@immutable
class MyWidgetTheme extends InheritedWidget {
  const MyWidgetTheme({required this.data, required super.child, super.key});

  final MyWidgetThemeData data;

  static MyWidgetThemeData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyWidgetTheme>()?.data;

  static MyWidgetThemeData of(BuildContext context) {
    final data = maybeOf(context);
    if (data == null) {
      throw FlutterError('No MyWidgetTheme found in the widget tree');
    }
    return data;
  }

  @override
  bool updateShouldNotify(covariant MyWidgetTheme oldWidget) =>
      data != oldWidget.data;
}

@freezed
abstract class MyWidgetThemeData with _$MyWidgetThemeData {
  const factory MyWidgetThemeData({Color? color, EdgeInsets? padding}) =
      _MyWidgetThemeData;
}
