part of '../project_details.dart';

class Mobile extends StatelessWidget {
  const Mobile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final projectCubit = ProjectsCubit.cubit(context);
    ScreenUtil.init(context, designSize: const Size(1440, 980));
    return SingleChildScrollView(
      child: Column(
        children: [
          LatestProjectSliderMobile(
            project: projectCubit.state.data!.first,
          ),
          Space.y2!,
          Padding(
            padding: Space.all(1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Label(
                  text: 'Projects',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Dummy.project.name,
                      style: AppText.h3b!.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    CustomButton(
                      child: Text(
                        'Get a quote',
                        style: AppText.l1!.cl(Colors.white),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Space.y!,
                SizedBox(
                  width: AppDimensions.size!.width * 0.8,
                  child: Text(
                    Dummy.project.description,
                    style: AppText.l1b!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Space.y2!,
                PointsCard(
                  header: 'Key Points',
                  points: Dummy.project.keyPoints,
                ),
                Space.y2!,
                PointsCard(
                  header: 'Key Features',
                  points: Dummy.project.features,
                ),
                Space.y2!,
                Row(
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
                          size: AppDimensions.normalize(10),
                        ),
                      )
                      .toList(),
                ),
                const BottomPageMobile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
