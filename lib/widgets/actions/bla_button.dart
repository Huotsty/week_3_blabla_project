import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

enum BlaButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final BlaButtonType type;

  const BlaButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.type = BlaButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Color iconColor;

    switch (type) {
      case BlaButtonType.primary:
        backgroundColor = BlaColors.primary;
        textColor = BlaColors.white;
        iconColor = BlaColors.white;
        break;
      case BlaButtonType.secondary:
        backgroundColor = BlaColors.white;
        textColor = BlaColors.primary;
        iconColor = BlaColors.primary;
        break;
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon, color: iconColor) : Container(),
      label: Text(
        label,
        style: BlaTextStyles.button.copyWith(color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
            horizontal: BlaSpacings.m, vertical: BlaSpacings.s),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BlaSpacings.radius),
        ),
      ),
    );
  }
}
