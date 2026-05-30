# widget_theme

[![build](https://github.com/albinpk/widget_theme/actions/workflows/publish-builder.yml/badge.svg)](https://github.com/albinpk/widget_theme/actions/workflows/publish-builder.yml)
[![Pub Version](https://img.shields.io/pub/v/widget_theme)](https://pub.dev/packages/widget_theme)
[![Pub Points](https://img.shields.io/pub/points/widget_theme)](https://pub.dev/packages/widget_theme/score)
[![codecov](https://codecov.io/gh/albinpk/widget_theme/graph/badge.svg?token=76MQ6XGM5F)](https://codecov.io/gh/albinpk/widget_theme)
[![GitHub License](https://img.shields.io/github/license/albinpk/widget_theme)](https://github.com/albinpk/widget_theme/blob/main/LICENSE)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg)](https://github.com/invertase/melos)

Code generation for widget-level theming in Flutter.

`widget_theme` generates strongly-typed theme models directly from your widget properties, enabling consistent, scalable, and centralized theming using Flutter’s `ThemeData` and `ThemeExtension`. This package is incredibly useful if you are building a customizable widget library or reusing widgets across multiple modules or apps where clients might want to override their appearance.

| MyWidget                                                                                            | MyWidgetTheme                                                                                           |
| --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| ![MyWidget](https://raw.githubusercontent.com/albinpk/widget_theme/refs/heads/main/docs/before.png) | ![MyWidgetTheme](https://raw.githubusercontent.com/albinpk/widget_theme/refs/heads/main/docs/after.png) |

---

## Features

- Generate theme classes from widget properties
- Built on top of `ThemeExtension`
- Automatic `copyWith`, `lerp`, equality (`==` and `hashCode`), and diagnostics (`Diagnosticable`)
- Context-based access (`MyWidgetTheme.of(context)`) and extensions (`context.myWidgetTheme`)
- Supports widget-level overrides
- Fine-grained control over generated code
- Zero manual boilerplate

---

## Installation

Add dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  widget_theme_annotation: ^latest

dev_dependencies:
  build_runner: ^latest
  widget_theme: ^latest
```

Or run the following command:

```sh
flutter pub add \
  widget_theme_annotation \
  dev:widget_theme \
  dev:build_runner
```

---

## Usage

### 1. Annotate your widget

```dart
@widgetTheme
class MyWidget extends StatelessWidget {
  const MyWidget({
    this.padding,
    this.color,
    super.key,
  });

  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    // Merge widget properties with the theme from the context
    final theme = context.myWidgetTheme._mergeWidget(this);

    return Padding(
      padding: theme.padding ?? const EdgeInsets.all(8),
      child: Text(
        'Hello world!',
        style: TextStyle(color: theme.color),
      ),
    );
  }
}
```

---

### 2. Run code generation

```bash
dart run build_runner build
```

---

### 3. Use generated theme

```dart
MaterialApp(
  theme: ThemeData(
    extensions: const [
      MyWidgetTheme(color: Colors.red),
    ],
  ),
  home: const Scaffold(
    body: Center(child: MyWidget()),
  ),
);
```

---

## How It Works

`widget_theme` reads your widget's fields and generates a corresponding `ThemeExtension`. At runtime, it merges the widget properties (if provided) with the theme values (from the nearest `Theme` above it), using Flutter's theme propagation for consistency.

By default, the generator includes fields that meet **all** of the following criteria:

1. `final`
2. No initializer (e.g., `final Color? color;` instead of `final Color? color = Colors.red;`)
3. Nullable type (e.g., `Color?` instead of `Color`)
4. Not annotated with `@themeExclude`
5. The field type is either a [standard Flutter framework type](https://github.com/albinpk/widget_theme/blob/main/packages/widget_theme/lib/src/lerp_types.dart) (like `Color`, `TextStyle`, `EdgeInsets`, etc.) OR a `WidgetStateProperty`, OR the field is annotated with `@themeInclude`.

### Including Custom Types

If you have a custom type or a type that is not automatically recognized, you can force the generator to include it using the `@themeInclude` annotation. Note that for custom types, the `lerp` method will simply snap between the values at `t < 0.5` rather than smoothly interpolating.

```dart
@widgetTheme
class MyWidget extends StatelessWidget {
  const MyWidget({
    this.customData,
    super.key,
  });

  @themeInclude
  final CustomData? customData;
  // ...
}
```

### Excluding Properties

If you want to exclude a field that would otherwise be included automatically, use `@themeExclude`.

```dart
@widgetTheme
class MyWidget extends StatelessWidget {
  const MyWidget({
    this.color,
    super.key,
  });

  @themeExclude
  final Color? color; // This will not be part of the generated theme
  // ...
}
```

---

## Generated Output & APIs

For a widget `MyWidget`, the generator produces `MyWidgetTheme extends ThemeExtension<MyWidgetTheme>` with:

- `copyWith` and `lerp` implementation
- `operator ==` and `hashCode`
- `debugFillProperties` for diagnostics
- `MyWidgetTheme.of(context)` / `MyWidgetTheme.maybeOf(context)` helpers
- `_mergeWidget(MyWidget)` helper to prioritize widget properties over theme properties
- Scoped override API: `MyWidgetTheme.overrideWith(...)`
- `BuildContext` extension: `context.myWidgetTheme`
- `ThemeData` extension: `theme.myWidgetTheme`

---

## Configuration

You can customize the generated code by passing arguments to the `@WidgetTheme` annotation or configuring `build.yaml`.

```dart
@WidgetTheme(
  name: 'CustomWidgetThemeName',
  staticAccessor: true,          // Generate `of` and `maybeOf`
  mergeWidgetHelper: true,       // Generate `_mergeWidget`
  overrideWithHelper: true,      // Generate `overrideWith`
  diagnosticable: true,          // Mixin `Diagnosticable`
  equals: true,                  // Generate `==` and `hashCode`
  buildContextExtension: true,   // Generate `context.myWidgetTheme`
  themeDataExtension: true,      // Generate `theme.myWidgetTheme`
  docs: true,                    // Generate documentation
)
class MyWidget extends StatelessWidget {
  // ...
}
```

You can also set these options globally in your project's `build.yaml`:

```yaml
targets:
  $default:
    builders:
      widget_theme:
        options:
          staticAccessor: true
          mergeWidgetHelper: true
          overrideWithHelper: true
          diagnosticable: true
          equals: true
          buildContextExtension: true
          themeDataExtension: true
          docs: true
```

---

## Overriding Theme in Subtree

You can easily override the theme for a specific widget subtree without having to manually wrap it in a `Theme` widget:

```dart
MyWidgetTheme.overrideWith(
  data: const MyWidgetTheme(color: Colors.blue),
  child: const MyWidget(),
)
```

---

## When to Use

Use `widget_theme` when:

- You want reusable, themeable widgets
- You need consistent styling across the app
- You want to avoid manual boilerplate for `ThemeExtension`
- You are building design systems or UI libraries

---

## Related Packages

- [widget_theme_annotation](https://pub.dev/packages/widget_theme_annotation) – Provides annotations used for code generation

---

## License

MIT License
