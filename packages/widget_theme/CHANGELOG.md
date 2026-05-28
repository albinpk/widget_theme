## 0.1.3

 - **FEAT**: add docs generation configuration to WidgetTheme annotation.
 - **FEAT**: add documentation to generated theme classes and extensions.
 - **FEAT**: add @themeInclude annotation to allow including custom properties in generated themes.

## 0.1.2+1

 - **DOCS**: add before and after comparison images to README.

## 0.1.2

 - **FEAT**: add `ThemeExclude` annotation to allow ignoring fields during theme generation.
 - **DOCS**: update example with all supported types.

## 0.1.1+1

 - **test**: re-generate golden

## 0.1.1

 - **REFACTOR**: only generate for final and non-initialized fields.
 - **FIX**: update BuildContext extension.
 - **FEAT**: restrict generated properties to supported lerp types and refactor lerp logic for WidgetStateProperty compatibility.
 - **FEAT**: add configurable options to WidgetTheme annotation.

## 0.1.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

## 0.1.0-dev.6

 - **FIX**: remove `freezed` dependency.
 - **FIX**: ignore `unused_element` on `_mergeWidget`.
 - **FEAT**: workflow for test & analyze with codecov.
 - **DOCS**: add readme.

## 0.1.0-dev.5

 - **FIX**: analyzer warning.

## 0.1.0-dev.4

 - **FIX**: update dependency version constraints.

## 0.1.0-dev.3

> Note: This release has breaking changes.

 - **FEAT**: add static `overrideWith` method to generated themes.
 - **BREAKING** **FEAT**: migrate theme generation to use `ThemeExtension` instead of `InheritedWidget`, and add `_mergeWidget` method in theme class.

## 0.1.0-dev.2

 - **FEAT**: create `WidgetThemeGenerator` with base functionality and example app.
 - **DOCS**: update example app.
 - **DOCS**: update readme.

## 0.1.0-dev.1

 - **FEAT**: create workspace.

