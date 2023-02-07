import 'package:flutter/material.dart';

import 'package:poolart/configs/configs.dart';
import 'package:poolart/responsive/responsive.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        // height: MediaQuery.of(context).size.height * 0.06,
        padding: Responsive.isMobile(context)
            ? Space.all(1.25, 1)
            : Space.all(1.25, 0.75),
        decoration: UIProps.boxCard!.copyWith(
          color: AppTheme.c!.primary,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: child,
      ),
    );
  }
}
