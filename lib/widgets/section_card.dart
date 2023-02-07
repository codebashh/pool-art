import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poolart/configs/app.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/models/project.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/image_stack_card.dart';
import 'package:poolart/widgets/label.dart';

class SectionCard extends StatelessWidget {
  final Project? project;
  final bool isInverted;
  final String? title;
  final String? header;
  final String? imagePath;
  final Widget? bottomWidget;
  final bool showFeature;
  const SectionCard({
    Key? key,
    this.title,
    this.header,
    this.project,
    required this.isInverted,
    required this.imagePath,
    this.bottomWidget,
    this.showFeature = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    ScreenUtil.init(context, designSize: const Size(1440, 980));

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.525,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isInverted) const Spacer(),
          if (isInverted && imagePath != null)
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
          Expanded(
            flex: MediaQuery.of(context).size.width <= 1250 ? 3 : 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  text: header ?? project!.name,
                ),
                Space.y1!,
                Text(
                  title ?? project!.title,
                  style: MediaQuery.of(context).size.width <= 1200
                      ? AppText.h2b!.copyWith(
                          height: 1.1,
                        )
                      : AppText.h1b!.copyWith(
                          height: 1.1,
                        ),
                ),
                if (showFeature)
                  ...StaticUtils.featuresList.map(
                    (e) => Expanded(
                      child: Text(
                        '✔️ $e',
                        style: AppText.b2b!.copyWith(
                          height: 1.8,
                        ),
                      ),
                    ),
                  )
                else
                  Text(
                    project!.description,
                    style: AppText.l1,
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
