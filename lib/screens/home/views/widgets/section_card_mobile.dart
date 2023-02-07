// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:poolart/configs/app.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/models/project.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/image_stack_card.dart';
import 'package:poolart/widgets/label.dart';

class SectionCardMobile extends StatelessWidget {
  final double height;
  final double? width;
  final Project project;
  final bool isInverted;
  final String? title;
  final String? imagePath;
  final Widget? bottomWidget;
  final bool showFeature;
  const SectionCardMobile({
    Key? key,
    this.height = 0.0,
    this.width,
    required this.project,
    required this.isInverted,
    this.title,
    required this.imagePath,
    this.bottomWidget,
    this.showFeature = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    ScreenUtil.init(context, designSize: const Size(1440, 980));

    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isInverted && imagePath != null)
            SizedBox(
              height: AppDimensions.size!.height * 0.34,
              width: AppDimensions.size!.width * 0.52,
              child: Stack(
                children: [
                  Align(
                    alignment:
                        isInverted ? Alignment.bottomLeft : Alignment.topRight,
                    child: Container(
                      color: AppTheme.c!.primary,
                      height: AppDimensions.size!.height * 0.32,
                      width: AppDimensions.size!.width * 0.50,
                    ),
                  ),
                  Align(
                    alignment:
                        isInverted ? Alignment.topRight : Alignment.bottomLeft,
                    child: Container(
                      height: AppDimensions.size!.height * 0.265,
                      width: AppDimensions.size!.width * 0.50,
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
                        imageUrl: StaticUtils.aboutUsNetworkImg,
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
            ),
          Space.x1!,
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  text: title ?? project.name,
                ),
                Space.y1!,
                Text(
                  project.title,
                  style: AppText.l1b!.copyWith(
                    height: 1.1,
                  ),
                ),
                Space.y!,
                if (showFeature)
                  ...project.features.map(
                    (e) => Text(
                      '✔️  $e',
                      style: AppText.l2b,
                    ),
                  )
                else
                  Text(
                    project.description,
                    style: AppText.l2,
                  ),
                if (bottomWidget != null) ...[
                  Space.y!,
                  bottomWidget!,
                ],
              ],
            ),
          ),
          const Spacer(),
          if (!isInverted && imagePath != null) ...[
            ImageStackCard(
              isInverted: isInverted,
              imagePath: imagePath!,
            ),
            if (MediaQuery.of(context).size.width >= 1500)
              const Spacer()
            else
              SizedBox(
                width: AppDimensions.normalize(25),
              ),
          ],
        ],
      ),
    );
  }
}
