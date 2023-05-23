import 'package:flutter/material.dart';

import 'core_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Palette.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.primary,
      elevation: 10,
    ),
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Palette.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.primary,
      elevation: 10,
    ),
  );
}
