import 'package:code_builder/code_builder.dart';
import 'package:widget_theme/src/extensions.dart';
import 'package:widget_theme/src/lerp_types.dart';

abstract class Common {
  static Method copyWith({
    required String className,
    required List<Prop> props,
    bool override = true,
    bool implemented = true,
  }) {
    return Method((m) {
      m
        ..name = 'copyWith'
        ..returns = Reference(className)
        ..optionalParameters.addAll(
          props.map((e) {
            return Parameter((p) {
              p
                ..name = e.name
                ..type = Reference(e.nullable)
                ..named = true;
            });
          }),
        );

      if (override) m.annotations.add(const CodeExpression(Code('override')));

      if (implemented) {
        m
          ..lambda = true
          ..body = Code(
            "$className(${props.map((e) {
              return '${e.name}: ${e.name} ?? this.${e.name}';
            }).join(',')})",
          );
      }
    });
  }

  static Method lerp({
    required String className,
    required List<Prop> props,
    bool override = true,
    bool implemented = true,
  }) {
    return Method((m) {
      m
        ..name = 'lerp'
        ..returns = Reference(className)
        ..requiredParameters.addAll([
          Parameter((p) {
            p
              ..name = 'other'
              ..type = Reference('ThemeExtension<$className>?');
          }),
          Parameter((p) {
            p
              ..name = 't'
              ..type = const Reference('double');
          }),
        ]);

      String map(Prop e) {
        final name = e.name;
        final rightSide = () {
          final type = e.type;
          if (type.startsWith('WidgetStateProperty')) {
            if (!type.startsWith('WidgetStateProperty<')) {
              throw Exception(
                'WidgetStateProperty without type parameters is not supported: "${e.name}"',
              );
            }
            final p = type.substring(type.indexOf('<') + 1, type.indexOf('>'));
            if (!p.isNullable) {
              throw Exception(
                'Only nullable WidgetStateProperty is supported: "${e.name}"',
              );
            }
            final lerp = lerpTypes.contains(p.nonNull)
                ? '${p.nonNull}.lerp'
                : '(a, b, t) => t < 0.5 ? a : b';
            return '''
              WidgetStateProperty.lerp<$p>(
                $name,
                other.$name,
                t,
                $lerp
              )${e.isNullable ? '' : '!'}''';
          }
          if (e.isFramework) {
            return '${e.nonNull}.lerp($name, other.$name, t)${e.isNullable ? '' : '!'}';
          }
          if (e.lerp case final fn?) return '$fn($name, other.$name, t)';
          return 't < 0.5 ? $name : other.$name';
        }();
        return '$name: $rightSide';
      }

      if (override) m.annotations.add(const CodeExpression(Code('override')));

      if (implemented) {
        m.body = Code('''
                if (other is! $className) return this;
                return $className(${props.map(map).join(',')});''');
      }
    });
  }

  static List<Method> of({
    required String className,
    bool docs = true,
  }) {
    return [
      // maybeOf
      Method((m) {
        m
          ..name = 'maybeOf'
          ..static = true
          ..returns = Reference('$className?');
        if (docs) {
          m.docs.add('''
/// Returns the nearest [$className] in the widget tree.
///
/// Returns `null` if no theme is found.''');
        }
        m
          ..requiredParameters.add(
            Parameter((p) {
              p
                ..name = 'context'
                ..type = const Reference('BuildContext');
            }),
          )
          ..lambda = true
          ..body = Code('Theme.of(context).extension<$className>()');
      }),

      // of
      Method((m) {
        m
          ..name = 'of'
          ..static = true
          ..returns = Reference(className);
        if (docs) {
          m.docs.add('''
/// Returns the nearest [$className] in the widget tree.
///
/// Throws a [FlutterError] if no theme is found.''');
        }
        m
          ..requiredParameters.add(
            Parameter((p) {
              p
                ..name = 'context'
                ..type = const Reference('BuildContext');
            }),
          )
          ..body = Code('''
                  final data = maybeOf(context);
                  if (data == null) {
                    throw FlutterError('No $className found in the widget tree');
                  }
                  return data;
                ''');
      }),
    ];
  }

  static Method override({
    required String className,
    bool docs = true,
  }) {
    return Method((m) {
      m
        ..name = 'overrideWith'
        ..returns = const Reference('Widget')
        ..static = true
        ..lambda = true;
      if (docs) {
        m.docs.add('''
/// Overrides the current [$className] for the given subtree.
///
/// This creates a scoped theme override using Flutter's theme system.''');
      }
      m
        ..optionalParameters.addAll([
          Parameter((p) {
            p
              ..name = 'data'
              ..named = true
              ..required = true
              ..type = Reference(className);
          }),
          Parameter((p) {
            p
              ..name = 'child'
              ..named = true
              ..required = true
              ..type = const Reference('Widget');
          }),
        ])
        ..body = const Code('''
            Builder(
              builder: (context) => Theme(
                data: Theme.of(context).copyWith(extensions: [data]),
                child: child,
              ),
            )''');
    });
  }

  static List<Method> equals({
    required String className,
    required List<Prop> props,
    bool docs = true,
  }) {
    return [
      // == operator
      Method((m) {
        m
          ..name = 'operator =='
          ..annotations.add(const CodeExpression(Code('override')))
          ..returns = const Reference('bool')
          ..requiredParameters.add(
            Parameter((p) {
              p
                ..name = 'other'
                ..type = const Reference('Object');
            }),
          )
          ..body = Code('''
                if (identical(this, other)) return true;
                if (other.runtimeType != runtimeType) return false;
                return other is $className &&
                ${props.map((e) {
            return "other.${e.name} == ${e.name}";
          }).join('&&')};''');
      }),

      // hashCode
      Method((m) {
        m
          ..name = 'hashCode'
          ..type = .getter
          ..annotations.add(const CodeExpression(Code('override')))
          ..returns = const Reference('int')
          ..lambda = true;
        // use Object.hashAll if there are more than 19 fields
        if (props.length > 19) {
          m.body = Code('''
                Object.hashAll([
                  runtimeType,
                  ${props.map((e) => e.name).join(', ')}
                ])''');
        } else {
          m.body = Code('''
                Object.hash(
                  runtimeType,
                  ${props.map((e) => e.name).join(', ')}
                )''');
        }
      }),
    ];
  }

  static Method debugFill({required List<Prop> props}) {
    return Method.returnsVoid((m) {
      m
        ..name = 'debugFillProperties'
        ..annotations.add(const CodeExpression(Code('override')))
        ..requiredParameters.add(
          Parameter((p) {
            p
              ..name = 'properties'
              ..type = const Reference('DiagnosticPropertiesBuilder');
          }),
        )
        ..body = Code('''
                super.debugFillProperties(properties);
                properties..
                ${props.map((e) {
          return "add(DiagnosticsProperty<${e.type.nonNull}>('${e.name}', ${e.name}))";
        }).join('..')};''');
    });
  }

  static Extension contextExtension({
    required String className,
    bool docs = true,
  }) {
    return Extension((e) {
      e
        ..name = '${className}BuildContextX'
        ..on = const Reference('BuildContext');
      if (docs) {
        e.docs.add(
          '/// Extension for accessing [$className] from [BuildContext].',
        );
      }
      e.methods.add(
        Method((f) {
          final getterName =
              className[0].toLowerCase() + className.substring(1);
          f
            ..name = getterName
            ..returns = Reference(className)
            ..type = .getter
            ..lambda = true;
          if (docs) f.docs.add('/// Returns the current [$className].');
          f.body = Code('Theme.of(this).extension<$className>()!');
        }),
      );
    });
  }

  static Extension themeDataExtension({
    required String className,
    bool docs = true,
  }) {
    return Extension((e) {
      e
        ..name = '${className}ThemeDataX'
        ..on = const Reference('ThemeData');
      if (docs) {
        e.docs.add(
          '/// Extension for accessing [$className] from [ThemeData].',
        );
      }
      e.methods.add(
        Method((f) {
          f
            ..name = '${className[0].toLowerCase()}${className.substring(1)}'
            ..returns = Reference(className)
            ..type = .getter
            ..lambda = true;
          if (docs) f.docs.add('/// Returns the registered [$className].');
          f.body = Code('extension<$className>()!');
        }),
      );
    });
  }
}

class Prop {
  const Prop({
    required this.name,
    required this.type,
    this.isFramework = false,
    this.isThemeOnly = false,
    this.isRequired = false,
    this.lerp,
  });

  final String name;
  final String type;
  final bool isFramework;
  final bool isThemeOnly;
  final bool isRequired;
  final String? lerp;

  bool get isNullable => type.isNullable;

  String get nonNull => type.nonNull;

  String get nullable => type.nullable;
}
