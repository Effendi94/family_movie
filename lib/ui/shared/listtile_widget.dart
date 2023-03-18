import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final IconData icon;
  final Color? color;
  const ListTileWidget({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: color ?? Colors.white,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color ?? Colors.white,
              fontWeight: FontWeight.w700,
            ),
      ),
      onTap: onPressed,
    );
  }
}
