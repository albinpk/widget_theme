import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:widget_theme_annotation/widget_theme_annotation.dart';

part '../../golden/all_types.dart';

@widgetTheme
@ShouldGenerateFile(
  '../../golden/all_types.dart',
  partOfCurrent: true,
)
class MyWidget extends StatelessWidget {
  const MyWidget({
    this.actionIconThemeData,
    this.alignment,
    this.alignmentDirectional,
    this.alignmentGeometry,
    this.animationStyle,
    this.appBarTheme,
    this.badgeThemeData,
    this.border,
    this.borderDirectional,
    this.borderRadius,
    this.borderRadiusDirectional,
    this.borderRadiusGeometry,
    this.bottomAppBarTheme,
    this.bottomAppBarThemeData,
    this.bottomNavigationBarThemeData,
    this.bottomSheetThemeData,
    this.boxBorder,
    this.boxConstraints,
    this.boxDecoration,
    this.boxShadow,
    this.buttonStyle,
    this.cardTheme,
    this.cardThemeData,
    this.carouselViewThemeData,
    this.checkboxThemeData,
    this.chipThemeData,
    this.color,
    this.datePickerThemeData,
    this.decoration,
    this.decorationImage,
    this.dialogTheme,
    this.dialogThemeData,
    this.dividerThemeData,
    this.drawerThemeData,
    this.dropdownMenuThemeData,
    this.edgeInsets,
    this.edgeInsetsDirectional,
    this.edgeInsetsGeometry,
    this.elevatedButtonThemeData,
    this.expansionTileThemeData,
    this.filledButtonThemeData,
    this.floatingActionButtonThemeData,
    this.flutterLogoDecoration,
    this.fontVariation,
    this.fontWeight,
    this.fractionalOffset,
    this.gradient,
    this.hSLColor,
    this.hSVColor,
    this.iconButtonThemeData,
    this.iconThemeData,
    this.linearBorderEdge,
    this.linearGradient,
    this.listTileThemeData,
    this.materialBannerThemeData,
    this.menuBarThemeData,
    this.menuButtonThemeData,
    this.menuStyle,
    this.menuThemeData,
    this.navigationBarThemeData,
    this.navigationDrawerThemeData,
    this.navigationRailThemeData,
    this.offset,
    this.outlinedBorder,
    this.outlinedButtonThemeData,
    this.popupMenuThemeData,
    this.progressIndicatorThemeData,
    this.radialGradient,
    this.radioThemeData,
    this.radius,
    this.rect,
    this.relativeRect,
    this.rRect,
    this.rSuperellipse,
    this.scrollbarThemeData,
    this.searchBarThemeData,
    this.searchViewThemeData,
    this.segmentedButtonThemeData,
    this.shadow,
    this.shapeBorder,
    this.shapeDecoration,
    this.size,
    this.snackBarThemeData,
    this.sweepGradient,
    this.switchThemeData,
    this.tableBorder,
    this.textButtonThemeData,
    this.textSelectionThemeData,
    this.textStyle,
    this.textTheme,
    this.timePickerThemeData,
    this.toggleButtonsThemeData,
    this.tooltipThemeData,
    super.key,
  });

  final ActionIconThemeData? actionIconThemeData;
  final Alignment? alignment;
  final AlignmentDirectional? alignmentDirectional;
  final AlignmentGeometry? alignmentGeometry;
  final AnimationStyle? animationStyle;
  final AppBarTheme? appBarTheme;
  final BadgeThemeData? badgeThemeData;
  final Border? border;
  final BorderDirectional? borderDirectional;
  final BorderRadius? borderRadius;
  final BorderRadiusDirectional? borderRadiusDirectional;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final BottomAppBarTheme? bottomAppBarTheme;
  final BottomAppBarThemeData? bottomAppBarThemeData;
  final BottomNavigationBarThemeData? bottomNavigationBarThemeData;
  final BottomSheetThemeData? bottomSheetThemeData;
  final BoxBorder? boxBorder;
  final BoxConstraints? boxConstraints;
  final BoxDecoration? boxDecoration;
  final BoxShadow? boxShadow;
  final ButtonStyle? buttonStyle;
  final CardTheme? cardTheme;
  final CardThemeData? cardThemeData;
  final CarouselViewThemeData? carouselViewThemeData;
  final CheckboxThemeData? checkboxThemeData;
  final ChipThemeData? chipThemeData;
  final Color? color;
  final DatePickerThemeData? datePickerThemeData;
  final Decoration? decoration;
  final DecorationImage? decorationImage;
  final DialogTheme? dialogTheme;
  final DialogThemeData? dialogThemeData;
  final DividerThemeData? dividerThemeData;
  final DrawerThemeData? drawerThemeData;
  final DropdownMenuThemeData? dropdownMenuThemeData;
  final EdgeInsets? edgeInsets;
  final EdgeInsetsDirectional? edgeInsetsDirectional;
  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final ElevatedButtonThemeData? elevatedButtonThemeData;
  final ExpansionTileThemeData? expansionTileThemeData;
  final FilledButtonThemeData? filledButtonThemeData;
  final FloatingActionButtonThemeData? floatingActionButtonThemeData;
  final FlutterLogoDecoration? flutterLogoDecoration;
  final FontVariation? fontVariation;
  final FontWeight? fontWeight;
  final FractionalOffset? fractionalOffset;
  final Gradient? gradient;
  final HSLColor? hSLColor;
  final HSVColor? hSVColor;
  final IconButtonThemeData? iconButtonThemeData;
  final IconThemeData? iconThemeData;
  final LinearBorderEdge? linearBorderEdge;
  final LinearGradient? linearGradient;
  final ListTileThemeData? listTileThemeData;
  final MaterialBannerThemeData? materialBannerThemeData;
  final MenuBarThemeData? menuBarThemeData;
  final MenuButtonThemeData? menuButtonThemeData;
  final MenuStyle? menuStyle;
  final MenuThemeData? menuThemeData;
  final NavigationBarThemeData? navigationBarThemeData;
  final NavigationDrawerThemeData? navigationDrawerThemeData;
  final NavigationRailThemeData? navigationRailThemeData;
  final Offset? offset;
  final OutlinedBorder? outlinedBorder;
  final OutlinedButtonThemeData? outlinedButtonThemeData;
  final PopupMenuThemeData? popupMenuThemeData;
  final ProgressIndicatorThemeData? progressIndicatorThemeData;
  final RadialGradient? radialGradient;
  final RadioThemeData? radioThemeData;
  final Radius? radius;
  final Rect? rect;
  final RelativeRect? relativeRect;
  final RRect? rRect;
  final RSuperellipse? rSuperellipse;
  final ScrollbarThemeData? scrollbarThemeData;
  final SearchBarThemeData? searchBarThemeData;
  final SearchViewThemeData? searchViewThemeData;
  final SegmentedButtonThemeData? segmentedButtonThemeData;
  final Shadow? shadow;
  final ShapeBorder? shapeBorder;
  final ShapeDecoration? shapeDecoration;
  final Size? size;
  final SnackBarThemeData? snackBarThemeData;
  final SweepGradient? sweepGradient;
  final SwitchThemeData? switchThemeData;
  final TableBorder? tableBorder;
  final TextButtonThemeData? textButtonThemeData;
  final TextSelectionThemeData? textSelectionThemeData;
  final TextStyle? textStyle;
  final TextTheme? textTheme;
  final TimePickerThemeData? timePickerThemeData;
  final ToggleButtonsThemeData? toggleButtonsThemeData;
  final TooltipThemeData? tooltipThemeData;

  @override
  Widget build(BuildContext context) {
    return const Text('Hello World');
  }
}
