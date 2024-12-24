import 'package:flutter/material.dart';

class Gettheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
  );
}
