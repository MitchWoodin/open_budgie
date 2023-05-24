import 'package:flutter/material.dart';

import '../theme/core_theme.dart';

class DrawerListTileButton extends StatelessWidget {
  final String title;
  final Icon? icon;
  final Color textColor;
  final VoidCallback onTap;


  const DrawerListTileButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.textColor = Palette.background,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        leading: icon,
        onTap: onTap);
  }
}
