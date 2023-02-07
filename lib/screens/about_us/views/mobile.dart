part of '../about_us.dart';

class Mobile extends StatelessWidget {
  final ScrollController controller;
  const Mobile({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: BlocBuilder<ProjectsCubit, ProjectsState>(
        builder: (context, state) {
          if (state is ProjectsFetchLoading) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LinearProgressIndicator(
                  minHeight: 10.0,
                ),
                Container(
                  height: AppDimensions.size!.height * 0.50,
                  color: Colors.grey[100],
                ),
              ],
            );
          } else if (state is ProjectsFetchFailed) {
            return Text(state.message!);
          } else if (state is ProjectsFetchSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Space.yf(4),
                Column(
                  children: [
                    const Label(
                      text: StaticUtils.aboutUs,
                      showPadding: false,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppDimensions.size!.width * 0.03),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'Information',
                            style: AppText.b1b!.cl(
                              AppTheme.c!.textSub!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Space.y1!,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    StatsCard(
                      text: '100 %',
                      subText: 'Client\nSatisfaction',
                    ),
                    StatsCard(
                      text: '245 +',
                      subText: 'Employees\nWorldWide',
                    ),
                    StatsCard(
                      text: '190 +',
                      subText: 'Projects\nCompleted',
                    ),
                  ],
                ),
                Space.y1!,
                SectionCardMobile(
                  width: MediaQuery.of(context).size.height * 0.35,
                  height: MediaQuery.of(context).size.height * 0.28,
                  project: Dummy.project,
                  title: "Services",
                  showFeature: true,
                  isInverted: true,
                  bottomWidget: CustomButton(
                    child: Text(
                      'Get a quote',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.size!.width * 0.025),
                    ),
                    onPressed: () => locator<AppNavigation>().navigateTo(
                      AppRoutes.getAQuote,
                    ),
                  ),
                  imagePath: StaticUtils.servicesNetworkImg,
                ),
                Space.y2!,
                Label(
                  text: StaticUtils.work,
                  showPadding: false,
                ),
                Space.y!,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppDimensions.size!.width * 0.03),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Latest ',
                              style: AppText.b2b!.cl(
                                AppTheme.c!.textSub!,
                              ),
                            ),
                            TextSpan(
                              text: 'Projects',
                              style: AppText.b2b!.cl(
                                AppTheme.c!.primary!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppTextIconButton(
                      onPressed: () {},
                      text: 'See Projects',
                      textStyle: AppText.l1b!.cl(
                        AppTheme.c!.textSub!,
                      ),
                    ),
                  ],
                ),
                Space.y!,
                LatestProjectSliderMobile(
                  project: state.data!.first,
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
                Space.y2!,
              ],
            );
          }
          return const Center(
            child: Text('Something went Wrong...!'),
          );
        },
      ),
    );
  }
}
