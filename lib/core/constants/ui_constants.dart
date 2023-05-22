import 'package:flutter/material.dart';

import '../theme/core_theme.dart';
import 'core_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            AssetConstants.LOGO,
            fit: BoxFit.cover,
            height: 50,
          ),
        ),
      ),
      backgroundColor: Palette.primary,
    );
  }

  static Drawer drawer() {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Hello"),
            Text("World"),
          ],
        ),
      ),
    ]));
  }
}
