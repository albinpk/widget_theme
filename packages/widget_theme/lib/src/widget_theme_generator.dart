import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_theme/src/lerp_types.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

/// Generator for [WidgetTheme] annotation.
class WidgetThemeGenerator extends GeneratorForAnnotation<WidgetTheme> {
  /// Generator for [WidgetTheme] annotation.
  const WidgetThemeGenerator({required this.options});

  /// Builder options.
  final BuilderOptions options;

  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element case final ClassElement element when _isWidget(element)) {
      final meta = annotation.parse(options);
      final generated = Library((l) {
        l.body.addAll([
          _buildThemeExtensionClass(
            element: element,
            buildStep: buildStep,
            meta: meta,
          ),
          if (meta.buildContextExtension ?? true)
            _buildContextExtension(element: element, meta: meta),
          if (meta.themeDataExtension ?? true)
            _buildThemeDataExtension(element: element, meta: meta),
          // _buildThemeClass(
          //   element: element,
          //   buildStep: buildStep,
          //   meta: meta,
          // ),
          // _buildThemeDataClass(
          //   element: element,
          //   buildStep: buildStep,
          //   meta: meta,
          // ),
        ]);
      });

      final emitter = DartEmitter(
        useNullSafetySyntax: true,
        orderDirectives: true,
        allocator: Allocator(),
      );

      return DartFormatter(
        languageVersion: DartFormatter.latestLanguageVersion,
      ).format(generated.accept(emitter).toString());
    }

    return null;
  }

  /*
  Class _buildThemeClass({
    required ClassElement element,
    required BuildStep buildStep,
    required WidgetTheme meta,
  }) {
    final className = '${element.name!}Theme';
    // final props = element.fields;

    return Class((c) {
      c
        ..name = className
        ..annotations.add(const Reference('immutable'))
        ..extend = (const Reference('InheritedWidget'))
        ..constructors.add(
          Constructor((c) {
            c
              ..constant = true
              ..optionalParameters.addAll([
                Parameter((p) {
                  p
                    ..name = 'data'
                    ..named = true
                    ..required = true
                    ..toThis = true;
                }),
                Parameter((p) {
                  p
                    ..name = 'child'
                    ..named = true
                    ..required = true
                    ..toSuper = true;
                }),
                Parameter((p) {
                  p
                    ..name = 'key'
                    ..named = true
                    ..toSuper = true;
                }),
              ]);
          }),
        )
        ..fields.add(
          Field((f) {
            f
              ..name = 'data'
              ..modifier = .final$
              ..type = Reference('${className}Data');
          }),
        )
        ..methods.addAll([
          // maybeOf
          Method((m) {
            m
              ..name = 'maybeOf'
              ..static = true
              ..returns = Reference('${className}Data?')
              ..requiredParameters.add(
                Parameter((p) {
                  p
                    ..name = 'context'
                    ..type = const Reference('BuildContext');
                }),
              )
              ..lambda = true
              ..body = Code('''
                  context.dependOnInheritedWidgetOfExactType<$className>()?.data
                ''');
          }),

          // of
          Method((m) {
            m
              ..name = 'of'
              ..static = true
              ..returns = Reference('${className}Data')
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

          // updateShouldNotify
          Method((m) {
            m
              ..name = 'updateShouldNotify'
              ..annotations.add(const Reference('override'))
              ..returns = const Reference('bool')
              ..requiredParameters.add(
                Parameter((p) {
                  p
                    ..name = 'oldWidget'
                    ..covariant = true
                    ..type = Reference(className);
                }),
              )
              ..lambda = true
              ..body = const Code('data != oldWidget.data');
          }),
        ]);
    });
  }

  Class _buildThemeDataClass({
    required ClassElement element,
    required BuildStep buildStep,
    required WidgetTheme meta,
  }) {
    final className = '${element.name!}ThemeData';
    final props = element.fields;

    return Class((c) {
      c
        ..name = className
        ..annotations.add(const Reference('freezed'))
        ..mixins.add(Reference('_\$$className'))
        ..abstract = true
        ..constructors.add(
          Constructor((c) {
            c
              ..constant = true
              ..factory = true
              ..redirect = Reference('_$className')
              ..optionalParameters.addAll(
                props.map((e) {
                  return Parameter((p) {
                    p
                      ..name = e.name!
                      ..named = true
                      ..type = Reference(e.type.nullable);
                  });
                }),
              );
          }),
        );
    });
  }
  */

  Class _buildThemeExtensionClass({
    required ClassElement element,
    required BuildStep buildStep,
    required WidgetTheme meta,
  }) {
    final widgetName = element.name!;
    final className = meta.name ?? '${element.name!}Theme';
    final props = element.fields.where((e) {
      final displayString = e.type.nonNull;
      return e.isFinal &&
          !e.hasInitializer &&
          e.type.isNullable &&
          (lerpTypes.contains(displayString) ||
              displayString.startsWith('WidgetStateProperty<'));
    }).toList();

    return Class((c) {
      c
        // class
        ..name = className
        ..extend = Reference('ThemeExtension<$className>');
      if (meta.diagnosticable ?? true) {
        c.mixins.add(const Reference('Diagnosticable'));
      }
      c
        ..annotations.add(const CodeExpression(Code('immutable')))
        // constructor
        ..constructors.add(
          Constructor((c) {
            c
              ..constant = true
              ..optionalParameters.addAll(
                props.map((e) {
                  return Parameter((p) {
                    p
                      ..toThis = true
                      ..name = e.name!
                      ..named = true;
                  });
                }),
              );
          }),
        )
        // fields
        ..fields.addAll([
          // instance fields
          ...props.map((e) {
            return Field((f) {
              f
                ..name = e.name
                ..modifier = .final$
                ..type = Reference(e.type.toString());
            });
          }),
        ])
        ..methods.addAll([
          // copyWith
          Method((m) {
            m
              ..name = 'copyWith'
              ..annotations.add(const CodeExpression(Code('override')))
              ..returns = Reference(className)
              ..optionalParameters.addAll(
                props.map((e) {
                  return Parameter((p) {
                    p
                      ..name = e.name!
                      ..type = Reference(e.type.nullable)
                      ..named = true;
                  });
                }),
              )
              ..lambda = true
              ..body = Code(
                "$className(${props.map((e) {
                  return '${e.name}: ${e.name} ?? this.${e.name}';
                }).join(',')})",
              );
          }),

          // lerp
          Method((m) {
            m
              ..name = 'lerp'
              ..annotations.add(const CodeExpression(Code('override')))
              ..returns = Reference(className)
              ..requiredParameters.addAll([
                Parameter((p) {
                  p
                    ..name = 'other'
                    ..type = Reference('$className?');
                }),
                Parameter((p) {
                  p
                    ..name = 't'
                    ..type = const Reference('double');
                }),
              ])
              ..body = Code('''
                if (other is! $className) return this;
                return $className(${props.map((e) {
                final name = e.name;
                return '$name: ${() {
                  if (e.type.element?.name == 'WidgetStateProperty') {
                    if (e.type case ParameterizedType(:final typeArguments)) {
                      if (typeArguments.isEmpty) throw Exception('WidgetStateProperty without type parameters is not supported: "${e.name}"');
                      final t = typeArguments.first;
                      if (!t.isNullable) throw Exception('Only nullable WidgetStateProperty is supported: "${e.name}"');
                      return '''
                          WidgetStateProperty.lerp<$t>(
                            $name,
                            other.$name,
                            t,
                            ${t.nonNull}.lerp,
                          )${e.type.isNullable ? '' : '!'}''';
                    }
                  }
                  return '${e.type.nonNull}.lerp($name, other.$name, t)${e.type.isNullable ? '' : '!'}';
                }()}';
              }).join(',')});''');
          }),

          if (meta.staticAccessor ?? true) ...[
            // maybeOf
            Method((m) {
              m
                ..name = 'maybeOf'
                ..static = true
                ..returns = Reference('$className?')
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
                ..returns = Reference(className)
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
          ],

          // _mergeWidget
          if (meta.mergeWidgetHelper ?? true)
            Method((m) {
              m
                ..name = '_mergeWidget'
                ..returns = Reference(className)
                ..lambda = true
                ..docs.add('// ignore: unused_element')
                ..requiredParameters.add(
                  Parameter((p) {
                    p
                      ..name = 'widget'
                      ..type = Reference(widgetName);
                  }),
                )
                ..body = Code('''
              copyWith(
              ${props.map((p) {
                  return '${p.name}: widget.${p.name}';
                }).join(',')}
              )''');
            }),

          // override
          if (meta.overrideWithHelper ?? true)
            Method((m) {
              m
                ..name = 'overrideWith'
                ..returns = const Reference('Widget')
                ..static = true
                ..lambda = true
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
            }),

          if (meta.equals ?? true) ...[
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
          ],

          // debugFillProperties
          if (meta.diagnosticable ?? true)
            Method.returnsVoid((m) {
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
            }),
        ]);
    });
  }

  Extension _buildContextExtension({
    required ClassElement element,
    required WidgetTheme meta,
  }) {
    final className = meta.name ?? '${element.name!}Theme';
    return Extension((e) {
      e
        ..name = '${className}BuildContextX'
        ..on = const Reference('BuildContext')
        ..methods.add(
          Method((f) {
            final getterName =
                className[0].toLowerCase() + className.substring(1);
            f
              ..name = getterName
              ..returns = Reference(className)
              ..type = .getter
              ..lambda = true
              ..body = Code(
                'Theme.of(this).extension<$className>()!',
              );
          }),
        );
    });
  }

  Extension _buildThemeDataExtension({
    required ClassElement element,
    required WidgetTheme meta,
  }) {
    final className = meta.name ?? '${element.name!}Theme';
    return Extension((e) {
      e
        ..name = '${className}ThemeDataX'
        ..on = const Reference('ThemeData')
        ..methods.add(
          Method((f) {
            f
              ..name = '${className[0].toLowerCase()}${className.substring(1)}'
              ..returns = Reference(className)
              ..type = .getter
              ..lambda = true
              ..body = Code('extension<$className>()!');
          }),
        );
    });
  }
}

extension on DartType {
  bool get isNullable => toString().endsWith('?');

  String get nonNull =>
      isNullable ? toString().substring(0, toString().length - 1) : toString();

  String get nullable => isNullable ? toString() : '${toString()}?';
}

extension on ConstantReader {
  WidgetTheme parse(BuilderOptions options) {
    final map = options.config;
    return WidgetTheme(
      name: objectValue.getField('name')?.toStringValue(),
      staticAccessor:
          objectValue.getField('staticAccessor')?.toBoolValue() ??
          map['staticAccessor'] as bool?,
      mergeWidgetHelper:
          objectValue.getField('mergeWidgetHelper')?.toBoolValue() ??
          map['mergeWidgetHelper'] as bool?,
      overrideWithHelper:
          objectValue.getField('overrideWithHelper')?.toBoolValue() ??
          map['overrideWithHelper'] as bool?,
      diagnosticable:
          objectValue.getField('diagnosticable')?.toBoolValue() ??
          map['diagnosticable'] as bool?,
      equals:
          objectValue.getField('equals')?.toBoolValue() ??
          map['equals'] as bool?,
      buildContextExtension:
          objectValue.getField('buildContextExtension')?.toBoolValue() ??
          map['buildContextExtension'] as bool?,
      themeDataExtension:
          objectValue.getField('themeDataExtension')?.toBoolValue() ??
          map['themeDataExtension'] as bool?,
    );
  }
}

const _widgetChecker = TypeChecker.fromUrl(
  'package:flutter/src/widgets/framework.dart#Widget',
);

bool _isWidget(ClassElement element) {
  return _widgetChecker.isAssignableFrom(element);
}
