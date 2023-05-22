import 'package:flutter/material.dart';

import '../theme/palette.dart';

class MainUtilityButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;

  const MainUtilityButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.backgroundColor = Palette.primary,
    this.textColor = Palette.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
    );
  }
}
