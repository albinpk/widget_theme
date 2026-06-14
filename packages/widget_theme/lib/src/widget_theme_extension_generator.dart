import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_theme/src/common.dart';
import 'package:widget_theme/src/extensions.dart';
import 'package:widget_theme/src/lerp_types.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

/// Generator for [WidgetThemeExtension] annotation.
class WidgetThemeExtensionGenerator
    extends GeneratorForAnnotation<WidgetThemeExtension> {
  /// Generator for [WidgetThemeExtension] annotation.
  const WidgetThemeExtensionGenerator({required this.options});

  /// Builder options.
  final BuilderOptions options;

  @override
  Future<String?> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element case final ClassElement element) {
      final name = element.name!;
      final resolver = buildStep.resolver;
      final constructor = element.constructors.firstWhereOrNull(
        (e) => e.isFactory,
      );
      if (constructor == null) {
        throw Exception('No redirected factory constructor found in $name');
      }
      final node = await resolver.astNodeFor(constructor.firstFragment);

      var params = <Prop>[];

      if (node case final ConstructorDeclaration c) {
        params = c.parameters.parameters
            .map((p) {
              final req = p is DefaultFormalParameter && p.isRequired;
              final param = p is DefaultFormalParameter ? p.parameter : p;
              if (param case SimpleFormalParameter()) {
                final type = param.type?.toSource() ?? 'dynamic';
                final typeNonNull = type.nonNull;
                return Prop(
                  name: param.name!.lexeme,
                  type: type,
                  isRequired: req,
                  isFramework:
                      lerpTypes.contains(typeNonNull) ||
                      typeNonNull.startsWith('WidgetStateProperty<'),
                );
              }
            })
            .nonNulls
            .toList();
      }

      final generated = Library((l) {
        l.body.addAll([
          _buildMixin(
            element: element,
            annotation: annotation,
            buildStep: buildStep,
            props: params,
          ),
          _buildBaseClass(
            element: element,
            annotation: annotation,
            buildStep: buildStep,
            props: params,
          ),
          _buildImpl(
            element: element,
            annotation: annotation,
            buildStep: buildStep,
            props: params,
          ),
          Common.contextExtension(className: element.name!),
          Common.themeDataExtension(className: element.name!),
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

  Mixin _buildMixin({
    required ClassElement element,
    required ConstantReader annotation,
    required BuildStep buildStep,
    required List<Prop> props,
  }) {
    final name = element.name!;
    return Mixin((c) {
      c
        ..name = '_\$$name'
        ..on = Reference('ThemeExtension<$name>')
        ..methods.addAll([
          for (final cp in props)
            Method((m) {
              m
                ..name = cp.name
                ..type = .getter
                ..returns = Reference(cp.type);
            }),
          Common.copyWith(
            className: name,
            props: props,
            implemented: false,
          ),
          Common.lerp(
            className: name,
            props: props,
            implemented: false,
          ),
        ]);
    });
  }

  Class _buildBaseClass({
    required ClassElement element,
    required ConstantReader annotation,
    required BuildStep buildStep,
    required List<Prop> props,
  }) {
    final name = element.name!;
    return Class((c) {
      c
        ..name = '_$name'
        ..abstract = true
        ..implements.add(Reference(name))
        ..constructors.add(
          Constructor((c) {
            c
              ..constant = true
              ..factory = true
              ..redirect = Reference('_\$${name}Impl')
              ..optionalParameters.addAll([
                for (final cp in props)
                  Parameter((p) {
                    p
                      ..name = cp.name
                      ..named = true
                      ..type = Reference(cp.type)
                      ..required = cp.isRequired;
                  }),
              ]);
          }),
        )
        ..methods.addAll([
          // ...Common.of(className: name),
          // Common.override(className: name), // TODO(albin): widget??
        ]);
    });
  }

  Class _buildImpl({
    required ClassElement element,
    required ConstantReader annotation,
    required BuildStep buildStep,
    required List<Prop> props,
  }) {
    final name = element.name!;
    final isDiagnosticable = element.allSupertypes.any(
      (e) => e.element.name == 'Diagnosticable',
    );
    return Class((c) {
      c
        ..name = '_\$${name}Impl'
        ..extend = Reference('ThemeExtension<$name>')
        ..implements.add(Reference('_$name'));
      if (isDiagnosticable) c.mixins.add(const Reference('Diagnosticable'));
      c
        ..annotations.add(const CodeExpression(Code('immutable')))
        ..constructors.add(
          Constructor((c) {
            c
              ..constant = true
              ..optionalParameters.addAll([
                for (final cp in props)
                  Parameter((p) {
                    p
                      ..name = cp.name
                      ..named = true
                      ..toThis = true
                      ..required = cp.isRequired;
                  }),
              ]);
          }),
        )
        ..fields.addAll([
          for (final cp in props)
            Field((f) {
              f
                ..annotations.add(const CodeExpression(Code('override')))
                ..name = cp.name
                ..type = Reference(cp.type)
                ..modifier = .final$;
            }),
        ])
        ..methods.addAll([
          Common.copyWith(className: name, props: props),
          Common.lerp(className: name, props: props),
          ...Common.equals(className: name, props: props),
          if (isDiagnosticable) Common.debugFill(props: props),
        ]);
    });
  }
}
