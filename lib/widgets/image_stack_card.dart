import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poolart/configs/configs.dart';

class ImageStackCard extends StatelessWidget {
  const ImageStackCard({
    Key? key,
    required this.isInverted,
    required this.imagePath,
  }) : super(key: key);

  final bool isInverted;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width <= 1250
          ? AppDimensions.size!.height * 0.55
          : AppDimensions.size!.height * 0.75,
      width: MediaQuery.of(context).size.width <= 600
          ? AppDimensions.size!.width * 0.90
          : MediaQuery.of(context).size.width <= 1250
              ? AppDimensions.size!.height * 0.60
              : AppDimensions.size!.height * 0.70,
      child: Stack(
        children: [
          Align(
            alignment: isInverted ? Alignment.bottomLeft : Alignment.topRight,
            child: Container(
              color: AppTheme.c!.primary,
              height: MediaQuery.of(context).size.width <= 600
                  ? AppDimensions.size!.height * 0.52
                  : AppDimensions.size!.height * 0.68,
              width: MediaQuery.of(context).size.width <= 600
                  ? AppDimensions.size!.width * 0.86
                  : AppDimensions.size!.height * 0.68,
            ),
          ),
          Align(
            alignment: isInverted ? Alignment.topRight : Alignment.bottomLeft,
            child: Container(
              height: MediaQuery.of(context).size.width <= 600
                  ? AppDimensions.size!.height * 0.52
                  : AppDimensions.size!.height * 0.50,
              width: MediaQuery.of(context).size.width <= 600
                  ? AppDimensions.size!.width * 0.85
                  : MediaQuery.of(context).size.width <= 1250
                      ? AppDimensions.size!.width * 0.36
                      : AppDimensions.size!.height * 0.68,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: Text(
                    'Loading...',
                    style: AppText.l2!.cl(Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
