// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyWidgetThemeData {

 Color? get color; EdgeInsets? get padding;
/// Create a copy of MyWidgetThemeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyWidgetThemeDataCopyWith<MyWidgetThemeData> get copyWith => _$MyWidgetThemeDataCopyWithImpl<MyWidgetThemeData>(this as MyWidgetThemeData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyWidgetThemeData&&(identical(other.color, color) || other.color == color)&&(identical(other.padding, padding) || other.padding == padding));
}


@override
int get hashCode => Object.hash(runtimeType,color,padding);

@override
String toString() {
  return 'MyWidgetThemeData(color: $color, padding: $padding)';
}


}

/// @nodoc
abstract mixin class $MyWidgetThemeDataCopyWith<$Res>  {
  factory $MyWidgetThemeDataCopyWith(MyWidgetThemeData value, $Res Function(MyWidgetThemeData) _then) = _$MyWidgetThemeDataCopyWithImpl;
@useResult
$Res call({
 Color? color, EdgeInsets? padding
});




}
/// @nodoc
class _$MyWidgetThemeDataCopyWithImpl<$Res>
    implements $MyWidgetThemeDataCopyWith<$Res> {
  _$MyWidgetThemeDataCopyWithImpl(this._self, this._then);

  final MyWidgetThemeData _self;
  final $Res Function(MyWidgetThemeData) _then;

/// Create a copy of MyWidgetThemeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = freezed,Object? padding = freezed,}) {
  return _then(_self.copyWith(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsets?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyWidgetThemeData].
extension MyWidgetThemeDataPatterns on MyWidgetThemeData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyWidgetThemeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyWidgetThemeData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyWidgetThemeData value)  $default,){
final _that = this;
switch (_that) {
case _MyWidgetThemeData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyWidgetThemeData value)?  $default,){
final _that = this;
switch (_that) {
case _MyWidgetThemeData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color? color,  EdgeInsets? padding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyWidgetThemeData() when $default != null:
return $default(_that.color,_that.padding);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color? color,  EdgeInsets? padding)  $default,) {final _that = this;
switch (_that) {
case _MyWidgetThemeData():
return $default(_that.color,_that.padding);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color? color,  EdgeInsets? padding)?  $default,) {final _that = this;
switch (_that) {
case _MyWidgetThemeData() when $default != null:
return $default(_that.color,_that.padding);case _:
  return null;

}
}

}

/// @nodoc


class _MyWidgetThemeData implements MyWidgetThemeData {
  const _MyWidgetThemeData({this.color, this.padding});
  

@override final  Color? color;
@override final  EdgeInsets? padding;

/// Create a copy of MyWidgetThemeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyWidgetThemeDataCopyWith<_MyWidgetThemeData> get copyWith => __$MyWidgetThemeDataCopyWithImpl<_MyWidgetThemeData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyWidgetThemeData&&(identical(other.color, color) || other.color == color)&&(identical(other.padding, padding) || other.padding == padding));
}


@override
int get hashCode => Object.hash(runtimeType,color,padding);

@override
String toString() {
  return 'MyWidgetThemeData(color: $color, padding: $padding)';
}


}

/// @nodoc
abstract mixin class _$MyWidgetThemeDataCopyWith<$Res> implements $MyWidgetThemeDataCopyWith<$Res> {
  factory _$MyWidgetThemeDataCopyWith(_MyWidgetThemeData value, $Res Function(_MyWidgetThemeData) _then) = __$MyWidgetThemeDataCopyWithImpl;
@override @useResult
$Res call({
 Color? color, EdgeInsets? padding
});




}
/// @nodoc
class __$MyWidgetThemeDataCopyWithImpl<$Res>
    implements _$MyWidgetThemeDataCopyWith<$Res> {
  __$MyWidgetThemeDataCopyWithImpl(this._self, this._then);

  final _MyWidgetThemeData _self;
  final $Res Function(_MyWidgetThemeData) _then;

/// Create a copy of MyWidgetThemeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = freezed,Object? padding = freezed,}) {
  return _then(_MyWidgetThemeData(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsets?,
  ));
}


}

// dart format on
