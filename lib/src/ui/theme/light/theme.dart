import 'package:flutter/material.dart';
import 'color.dart';
import 'typography.dart';

ThemeData buildTheme() {

  return ThemeData(
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    accentColor: colorScheme.secondary,
    scaffoldBackgroundColor: colorScheme.background,
    textTheme: buildTextTheme(),
  );
}