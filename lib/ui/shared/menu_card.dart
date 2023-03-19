import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final Widget child;
  const MenuCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
