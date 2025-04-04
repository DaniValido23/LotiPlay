import 'package:flutter/material.dart';

var themeColors =<Color> [
  Color.fromRGBO(64, 123, 255, 0.90),
  Color.fromRGBO(255, 114, 94, 0.90),
  Color.fromRGBO(186, 104, 200, 0.90),
  Color.fromRGBO(146, 227, 169, 0.90),
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false});

  ThemeData getTheme() => ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: themeColors[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: true),
  );
}
