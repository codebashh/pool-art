part of '../project_details.dart';

class Desktop extends StatelessWidget {
  final ScrollController controller;
  const Desktop({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Space.yf(8),
          Row(
            children: [
              Space.xf(8),
              SizedBox(
                height: AppDimensions.normalize(200),
                width: AppDimensions.normalize(350),
                child: Image.asset(
                  StaticUtils.aboutUsImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Space.x1!,
              Column(
                children: [
                  SizedBox(
                    height: AppDimensions.normalize(62),
                    width: AppDimensions.normalize(60),
                    child: Image.asset(
                      StaticUtils.aboutUsImage,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Space.y1!,
                  SizedBox(
                    height: AppDimensions.normalize(62),
                    width: AppDimensions.normalize(60),
                    child: Image.asset(
                      StaticUtils.aboutUsImage,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Space.y1!,
                  SizedBox(
                    height: AppDimensions.normalize(62),
                    width: AppDimensions.normalize(60),
                    child: Image.asset(
                      StaticUtils.aboutUsImage,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              )
            ],
          ),
          Space.y2!,
          Padding(
            padding: Space.all(8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 32.h,
                      child: VerticalDivider(
                        color: AppTheme.c!.primary,
                        thickness: 3.w,
                      ),
                    ),
                    Text(
                      LocaleKeys.projects.tr().toUpperCase(),
                      style: AppText.h3b!.copyWith(
                        color: AppTheme.c!.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Text(
                  Dummy.project.name,
                  style: AppText.h1b!.copyWith(
                    color: Colors.black,
                  ),
                ),
                Space.y1!,
                Text(
                  Dummy.project.title,
                  style: AppText.l1b!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Space.y2!,
                PointsCard(
                  header: LocaleKeys.keyPoints.tr(),
                  points: Dummy.project.keyPoints,
                ),
                Space.y2!,
                PointsCard(
                  header: LocaleKeys.keyFeatures.tr(),
                  points: Dummy.project.features,
                ),
                Space.y2!,
                CustomButton(
                  onPressed: () => locator<AppNavigation>().navigateTo(
                    AppRoutes.getAQuote,
                  ),
                  width: AppDimensions.normalize(50),
                  child: Text(
                    LocaleKeys.getAQuote.tr(),
                    style: AppText.l1b!.copyWith(
                      color: AppTheme.c!.background,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Space.yf(3),
          Container(
            margin: Space.all(11, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CommunityMaterialIcons.dropbox,
                CommunityMaterialIcons.atlassian,
                CommunityMaterialIcons.slack,
                CommunityMaterialIcons.google,
                FontAwesomeIcons.shopify,
              ]
                  .map(
                    (e) => Icon(
                      e,
                      color: AppTheme.c!.text,
                      size: AppDimensions.normalize(15),
                    ),
                  )
                  .toList(),
            ),
          ),
          const BottomPage(),
        ],
      ),
    );
  }
}
