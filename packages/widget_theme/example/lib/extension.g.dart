// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension.dart';

// **************************************************************************
// WidgetThemeExtensionGenerator
// **************************************************************************

mixin _$Shared on ThemeExtension<Shared> {
  int? get wow;
  double? get elevation;
  @override
  Shared copyWith({int? wow, double? elevation});
  @override
  Shared lerp(ThemeExtension<Shared>? other, double t);
}

abstract class _Shared implements Shared {
  const factory _Shared({int? wow, double? elevation}) = _$SharedImpl;
}

@immutable
class _$SharedImpl extends ThemeExtension<Shared> implements _Shared {
  const _$SharedImpl({this.wow, this.elevation});

  @override
  final int? wow;

  @override
  final double? elevation;

  @override
  Shared copyWith({int? wow, double? elevation}) =>
      Shared(wow: wow ?? this.wow, elevation: elevation ?? this.elevation);

  @override
  Shared lerp(ThemeExtension<Shared>? other, double t) {
    if (other is! Shared) return this;
    return Shared(
      wow: t < 0.5 ? wow : other.wow,
      elevation: t < 0.5 ? elevation : other.elevation,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Shared && other.wow == wow && other.elevation == elevation;
  }

  @override
  int get hashCode => Object.hash(runtimeType, wow, elevation);
}

/// Extension for accessing [Shared] from [BuildContext].
extension SharedBuildContextX on BuildContext {
  /// Returns the current [Shared].
  Shared get shared => Theme.of(this).extension<Shared>()!;
}

/// Extension for accessing [Shared] from [ThemeData].
extension SharedThemeDataX on ThemeData {
  /// Returns the registered [Shared].
  Shared get shared => extension<Shared>()!;
}

// **************************************************************************
// WidgetThemeGenerator
// **************************************************************************

@immutable
class OneTheme extends ThemeExtension<OneTheme> with Diagnosticable {
  const OneTheme({this.color, this.shared});

  final Color? color;

  final Shared? shared;

  @override
  OneTheme copyWith({Color? color, Shared? shared}) =>
      OneTheme(color: color ?? this.color, shared: shared ?? this.shared);

  @override
  OneTheme lerp(OneTheme? other, double t) {
    if (other is! OneTheme) return this;
    return OneTheme(
      color: Color.lerp(color, other.color, t),
      shared: t < 0.5 ? shared : other.shared,
    );
  }

  static OneTheme? maybeOf(BuildContext context) =>
      Theme.of(context).extension<OneTheme>();

  static OneTheme of(BuildContext context) {
    final data = maybeOf(context);
    if (data == null) {
      throw FlutterError('No OneTheme found in the widget tree');
    }
    return data;
  }

  // ignore: unused_element
  OneTheme _mergeWidget(One widget) =>
      copyWith(color: widget.color, shared: widget.shared);

  static Widget overrideWith({required OneTheme data, required Widget child}) =>
      Builder(
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(extensions: [data]),
          child: child,
        ),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is OneTheme && other.color == color && other.shared == shared;
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, shared);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Color>('color', color))
      ..add(DiagnosticsProperty<Shared>('shared', shared));
  }
}

extension OneThemeBuildContextX on BuildContext {
  OneTheme get oneTheme => Theme.of(this).extension<OneTheme>()!;
}

extension OneThemeThemeDataX on ThemeData {
  OneTheme get oneTheme => extension<OneTheme>()!;
}

@immutable
class TwoTheme extends ThemeExtension<TwoTheme> with Diagnosticable {
  const TwoTheme({this.color});

  final Color? color;

  @override
  TwoTheme copyWith({Color? color}) => TwoTheme(color: color ?? this.color);

  @override
  TwoTheme lerp(TwoTheme? other, double t) {
    if (other is! TwoTheme) return this;
    return TwoTheme(color: Color.lerp(color, other.color, t));
  }

  static TwoTheme? maybeOf(BuildContext context) =>
      Theme.of(context).extension<TwoTheme>();

  static TwoTheme of(BuildContext context) {
    final data = maybeOf(context);
    if (data == null) {
      throw FlutterError('No TwoTheme found in the widget tree');
    }
    return data;
  }

  // ignore: unused_element
  TwoTheme _mergeWidget(Two widget) => copyWith(color: widget.color);

  static Widget overrideWith({required TwoTheme data, required Widget child}) =>
      Builder(
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(extensions: [data]),
          child: child,
        ),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is TwoTheme && other.color == color;
  }

  @override
  int get hashCode => Object.hash(runtimeType, color);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty<Color>('color', color));
  }
}

extension TwoThemeBuildContextX on BuildContext {
  TwoTheme get twoTheme => Theme.of(this).extension<TwoTheme>()!;
}

extension TwoThemeThemeDataX on ThemeData {
  TwoTheme get twoTheme => extension<TwoTheme>()!;
}
