import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class InputTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  // If true the text is displayed ligher
  final bool isPlaceHolder;

  // A right button can be optionally provided
  final IconData? rightIcon;
  final VoidCallback? onRightIconPressed;

  const InputTile(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon, this.isPlaceHolder = false, this.rightIcon, this.onRightIconPressed, });

  @override
  Widget build(BuildContext context) {
    Color textColor =
    isPlaceHolder ? BlaColors.textLight : BlaColors.textNormal;
    return ListTile(
      onTap: onPressed,
      title: Text(title,
          style: BlaTextStyles.button
              .copyWith(fontSize: 14, color: textColor)),
      leading: Icon(
        icon,
        color: BlaColors.iconLight,
      ),
      trailing: rightIcon != null
          ? BlaIconButton(icon: rightIcon, onPressed: onRightIconPressed)
          : null,
    );
  }
}

class BlaIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;

  const BlaIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
          onTap: onPressed,
          child: Icon(icon, size: 14, color: BlaColors.primary)),
    );
  }
}
