import 'package:flutter/material.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/responsive/responsive.dart';

class Label extends StatelessWidget {
  final String text;
  final bool showPadding;
  const Label({
    Key? key,
    required this.text,
    this.showPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: showPadding
          ? Responsive.isMobile(context)
              ? Space.hf(0.7)
              : Space.hf(7)
          : EdgeInsets.zero,
      child: Row(
        children: [
          SizedBox(
            height: AppDimensions.normalize(10),
            child: VerticalDivider(
              color: AppTheme.c!.primary,
              thickness: AppDimensions.normalize(1),
            ),
          ),
          Text(
            text,
            style: MediaQuery.of(context).size.width <= 600
                ? AppText.b2b!.copyWith(
                    color: AppTheme.c!.primary,
                  )
                : AppText.h3b!.cl(
                    AppTheme.c!.primary!,
                  ),
          )
        ],
      ),
    );
  }
}
