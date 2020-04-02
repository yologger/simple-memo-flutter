import 'package:flutter/material.dart';

class AppColor {

  static const int _primary = 0xff01014d;
  static const MaterialColor primary = MaterialColor(
      _primary,
      <int, Color> {
        50: Color(0xffe4e4ef),
        100: Color(0xffbabcd7),
        200: Color(0xff8e90bd),
        300: Color(0xff6467a2),
        400: Color(0xff464991),
        500: Color(0xff262c7f),
        600: Color(0xff212577),
        700: Color(0xff181d6d),
        800: Color(0xff0f1361),
        900: Color(_primary),
      }
  );

  static const int _secondary = 0xfff91c6b;
  static const MaterialColor secondary = MaterialColor(
      _secondary,
      <int, Color> {
        50: Color(0xfffee5ed),
        100: Color(0xfffdbdd4),
        200: Color(0xfffc92b7),
        300: Color(0xfffb6599),
        400: Color(0xfff94182),
        500: Color(_secondary),
        600: Color(0xffe71968),
        700: Color(0xffd11563),
        800: Color(0xffbb105f),
        900: Color(0xff960858),
      }
  );

  static const Color background = Color(0xffffffff);
  static const Color surface = Color(0xFFFFFFFF);

  static const Color warning = Color(0xFFFF0000);
  static const Color error = Color(0xFFFFFF00);
  static const Color success = Color(0xFF00FF00);

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);

  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onSuccess = Color(0xFFFFFFFF);

  static const int _white = 0xFFFFFFFF;
  static const ColorSwatch white = ColorSwatch(
      _white,
      <String, Color>{
        "high": Color(_white),
        "medium": Color(0xB3FFFFFF),
        "inactive": Color(0x8AFFFFFF),
        "disabled": Color(0x80FFFFFF),
        "pressed": Color(0x52FFFFFF),
        "focus": Color(0x1FFFFFFF),
        "hover": Color(0x14FFFFFF),
      }
  );

  static const int _black = 0xDE000000;
  static const ColorSwatch black = ColorSwatch(
      _black,
      <String, Color>{
        "high": Color(_black),
        "medium": Color(0x99000000),
        "inactive": Color(0x8A000000),
        "disabled": Color(0x61000000),
        "pressed": Color(0x29000000),
        "focus": Color(0x1F000000),
        "hover": Color(0x14000000),
      }
  );
}

final colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColor.primary,                  // MaterialColor
  primaryVariant: AppColor.primary[900],      // Color
  secondary: AppColor.secondary,              // MaterialColor
  secondaryVariant: AppColor.secondary[600],  // Color
  background: AppColor.background,            // Color
  surface: AppColor.surface,
  error: AppColor.error,
  onPrimary: AppColor.onPrimary,
  onSecondary: AppColor.onSecondary,
  onBackground: AppColor.onBackground,
  onSurface: AppColor.onSurface,
  onError: AppColor.onError,
);
