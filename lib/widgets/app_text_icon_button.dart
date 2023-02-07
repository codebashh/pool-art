import 'package:flutter/material.dart';
import 'package:poolart/configs/configs.dart';

class AppTextIconButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  const AppTextIconButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: textStyle ??
                AppText.b2b!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Space.x!,
          Icon(
            Icons.arrow_forward_ios,
            size: AppDimensions.normalize(6),
            color: textStyle == null ? Colors.black : textStyle!.color,
          ),
        ],
      ),
    );
  }
}
