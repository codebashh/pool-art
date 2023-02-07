// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home.dart';

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
                _TopSliderMobile(
                  project: state.data!.first,
                ),
                Space.y1!,
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: Space.h1!,
                  child: Stack(
                    children: [
                      const ImageStackCard(
                        isInverted: false,
                        imagePath: StaticUtils.aboutUsNetworkImg,
                      ),
                      Padding(
                        padding: Space.all(0.5, 3),
                        child: SectionCardMobile(
                          showFeature: false,
                          project: state.data!.last,
                          isInverted: false,
                          imagePath: null,
                        ),
                      ),
                      Positioned(
                        bottom: AppDimensions.normalize(2),
                        child: CustomButton(
                          child: const Text(
                            'Get a Quote',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => locator<AppNavigation>().navigateTo(
                            AppRoutes.getAQuote,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Space.y2!,
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
                Space.yf(2),
                Padding(
                  padding: Space.hf(1),
                  child: SectionCardMobile(
                    width: MediaQuery.of(context).size.height * 0.30,
                    height: MediaQuery.of(context).size.height * 0.27,
                    project: Dummy.project,
                    title: "Services",
                    showFeature: true,
                    isInverted: true,
                    bottomWidget: CustomButton(
                      child: Text(
                        'Get a Quote',
                        style: AppText.l2b!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => locator<AppNavigation>().navigateTo(
                        AppRoutes.getAQuote,
                      ),
                    ),
                    imagePath: StaticUtils.servicesNetworkImg,
                  ),
                ),
                Space.y2!,
                Label(
                  text: StaticUtils.work,
                  showPadding: true,
                ),
                Space.y!,
                Padding(
                  padding: Space.hf(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
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
                      AppTextIconButton(
                        onPressed: () {
                          locator<AppNavigation>().navigateTo(
                            AppRoutes.projectDetails,
                          );
                        },
                        text: 'See Projects',
                      ),
                    ],
                  ),
                ),
                Space.y2!,
                LatestProjectSliderMobile(
                  project: state.data!.first,
                ),
                Space.y2!,
                Padding(
                  padding: Space.hf(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            size: AppDimensions.normalize(9),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Space.y2!,
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
