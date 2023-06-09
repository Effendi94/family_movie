import 'package:flutter/material.dart';

import '../../../application/app/constants/custom_colors.dart';

class SubHeadingText extends StatelessWidget {
  final String headingText;
  final Function()? onTap;
  final Color? color;
  const SubHeadingText({
    Key? key,
    required this.headingText,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headingText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: color ?? CustomColors.textPrimary,
                ),
          ),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'See More',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: color ?? CustomColors.textPrimary,
                      ),
                ),
                Icon(
                  Icons.arrow_right,
                  color: color ?? CustomColors.textPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
