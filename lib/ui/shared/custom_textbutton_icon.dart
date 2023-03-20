import 'package:flutter/material.dart';

import '../../application/app/constants/custom_colors.dart';

class CustomTextButtonIcon extends StatelessWidget {
  final Function() onTap;
  final String label;
  final IconData icon;
  const CustomTextButtonIcon({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15,
                color: CustomColors.white,
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: CustomColors.neutral40,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
