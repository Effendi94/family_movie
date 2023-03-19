import 'package:flutter/material.dart';

import '../../../application/app/constants/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final double? iconSize;
  final TextStyle? textStyle;
  final bool isWhite;
  final double? width;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonStyle,
    this.trailingIcon,
    this.leadingIcon,
    this.iconSize,
    this.textStyle,
    this.width,
    this.isWhite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor: isWhite ? Colors.white : CustomColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            leadingIcon != null
                ? Icon(
                    leadingIcon,
                    size: iconSize ?? 20,
                    color: isWhite ? CustomColors.primary : Colors.white,
                  )
                : Container(),
            const SizedBox(width: 5),
            Text(
              text,
              style: textStyle ??
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isWhite ? CustomColors.primary : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
            ),
            trailingIcon != null ? const SizedBox(width: 5) : const SizedBox(),
            trailingIcon != null
                ? Icon(
                    trailingIcon,
                    size: iconSize ?? 20,
                    color: isWhite ? CustomColors.primary : Colors.white,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
