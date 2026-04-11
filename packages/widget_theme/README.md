# widget_theme

[![build](https://github.com/albinpk/widget_theme/actions/workflows/publish-builder.yml/badge.svg)](https://github.com/albinpk/widget_theme/actions/workflows/publish-builder.yml)
[![Pub Version](https://img.shields.io/pub/v/widget_theme)](https://pub.dev/packages/widget_theme)
[![Pub Points](https://img.shields.io/pub/points/widget_theme)](https://pub.dev/packages/widget_theme/score)
[![codecov](https://codecov.io/gh/albinpk/widget_theme/graph/badge.svg?token=76MQ6XGM5F)](https://codecov.io/gh/albinpk/widget_theme)
[![GitHub License](https://img.shields.io/github/license/albinpk/widget_theme)](https://github.com/albinpk/widget_theme/blob/main/LICENSE)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg)](https://github.com/invertase/melos)

Code generation for widget-level theming in Flutter.

`widget_theme` generates strongly-typed theme models directly from your widget properties, enabling consistent, scalable, and centralized theming using Flutter’s `ThemeData` and `ThemeExtension`.

---

## Features

- Generate theme classes from widget properties
- Built on top of ThemeExtension
- Automatic `copyWith`, `lerp`, equality, and diagnostics
- Context-based access (`MyWidgetTheme.of(context)`)
- Supports widget-level overrides
- Zero manual boilerplate

---

## Installation

Add dependencies:

```yaml
dependencies:
  widget_theme_annotation: ^latest

dev_dependencies:
  build_runner: ^latest
  widget_theme: ^latest
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
    final theme = MyWidgetTheme.of(context)._mergeWidget(this);

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

## Generated Output

For the annotated widget above, the generator produces:

- `MyWidgetTheme extends ThemeExtension<MyWidgetTheme>`
- `copyWith` and `lerp`
- `of` / `maybeOf` helpers
- widget-to-theme merge helper
- Scoped override API
- `BuildContext` and `ThemeData` extensions

---

## Overriding Theme in Subtree

You can override the theme for a specific widget subtree:

```dart
MyWidgetTheme.overrideWith(
  data: const MyWidgetTheme(color: Colors.blue),
  child: const MyWidget(),
)
```

This creates a scoped override using Flutter’s theme system.

---

## Accessing Theme

```dart
final theme = MyWidgetTheme.of(context);

// or via extension
final theme = context.myWidgetTheme;
```

---

## How It Works

- Reads widget constructor fields
- Generates a corresponding `ThemeExtension`
- Merges widget properties with theme values at runtime
- Uses Flutter’s theme propagation for consistency

---

## When to Use

Use `widget_theme` when:

- You want reusable, themeable widgets
- You need consistent styling across the app
- You want to avoid manual theme boilerplate
- You are building design systems or UI libraries

---

## Related Package

- [widget_theme_annotation](https://pub.dev/packages/widget_theme_annotation) – Provides annotations used for code generation

---

## License

MIT License
