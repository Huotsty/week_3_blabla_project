import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class InputTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  const InputTile(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(title,
          style: BlaTextStyles.button
              .copyWith(fontSize: 14, color: BlaColors.neutralLight)),
      leading: Icon(
        icon,
        color: BlaColors.iconLight,
      ),
    );
  }
}
