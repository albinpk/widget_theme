import 'package:analyzer/dart/element/type.dart';

extension StringTypeX on String {
  bool get isNullable => endsWith('?');

  String get nonNull => isNullable ? substring(0, length - 1) : this;

  String get nullable => isNullable ? this : '$this?';
}

extension DartTypeX on DartType {
  bool get isNullable => toString().isNullable;

  String get nonNull => toString().nonNull;

  String get nullable => toString().nullable;
}
