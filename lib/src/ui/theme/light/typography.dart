import 'package:flutter/material.dart';

class Typography {

  static const h1 = TextStyle(
    fontSize: 96,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
  );

  static const h2 = TextStyle(
    fontSize: 60,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
  );
  static const h3 = TextStyle(
    fontSize: 48,
    fontFamily: 'Roboto',
  );
  static const h4 = TextStyle(
    fontSize: 34,
    fontFamily: 'Roboto',
  );
  static const h5 = TextStyle(
    fontSize: 24,
    fontFamily: 'Roboto',
  );
  static const h6 = TextStyle(
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static const body1 = TextStyle(
    fontSize: 18,
    fontFamily: 'Roboto',
  );

  static const body2 = TextStyle(
    fontFamily: 'Roboto',
  );

  static const subtitle1 = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
  );

  static const subtitle2 = TextStyle(
    fontFamily: 'Roboto',
  );

  static const button = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static const caption = TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto',
  );

  static const overline = TextStyle(
    fontSize: 10,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );
}


TextTheme buildTextTheme() {
  return TextTheme(
    display4: Typography.h1,
    display3: Typography.h2,
    display2: Typography.h3,
    display1: Typography.h4,
    headline: Typography.h5,
    title: Typography.h6,
    subhead: Typography.subtitle1,
    body2: Typography.body1,
    body1: Typography.body2,
    caption: Typography.caption,
    button: Typography.button,
    subtitle: Typography.subtitle2,
    overline: Typography.overline,
  );
}
