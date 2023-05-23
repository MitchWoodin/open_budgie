import 'package:flutter/material.dart';

import 'core_theme.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Palette.primaryVariant,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.primary,
      elevation: 10,
    ),
  );
}
