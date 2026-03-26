import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

/// Generator for [WidgetTheme] annotation.
class WidgetThemeGenerator extends GeneratorForAnnotation<WidgetTheme> {
  /// Generator for [WidgetTheme] annotation.
  const WidgetThemeGenerator({required this.options});

  /// Builder options.
  final BuilderOptions options;

  @override
  Future<String?> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element case final ClassElement element when _isWidget(element)) {
      final meta = annotation.parse(options);
      final generated = Library((l) {
        l
          ..ignoreForFile.add('unreachable_from_main')
          ..body.addAll([
            _buildThemeClass(
              element: element,
              buildStep: buildStep,
              meta: meta,
            ),
            _buildThemeDataClass(
              element: element,
              buildStep: buildStep,
              meta: meta,
            ),
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
    return const WidgetTheme();
  }
}

const _widgetChecker = TypeChecker.fromUrl(
  'package:flutter/src/widgets/framework.dart#Widget',
);

bool _isWidget(ClassElement element) {
  return _widgetChecker.isAssignableFrom(element);
}
