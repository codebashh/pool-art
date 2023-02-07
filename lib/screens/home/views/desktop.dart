part of '../home.dart';

class Desktop extends StatelessWidget {
  final ScrollController controller;
  const Desktop({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(1440, 980));

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
                  height: AppDimensions.size!.height * 0.90,
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
                _TopSlider(
                  projects: state.data!
                      .where((element) =>
                          element.id != 'aboutus' && element.id != 'services')
                      .toList(),
                ),
                Space.yf(5),
                SectionCard(
                  header: LocaleKeys.aboutUs.tr(),
                  title: LocaleKeys.aboutUsTitle.tr(),
                  project: Dummy.project,
                  isInverted: false,
                  imagePath: StaticUtils.aboutUsNetworkImg,
                  bottomWidget: CustomButton(
                    onPressed: () => locator<AppNavigation>()
                        .navigateTo(AppRoutes.getAQuote),
                    child: Text(
                      LocaleKeys.getAQuote.tr(),
                      style: AppText.b2b!.cl(
                        Colors.white,
                      ),
                    ),
                  ),
                ),
                Space.yf(5),
                SectionCard(
                  header: LocaleKeys.services.tr(),
                  title: LocaleKeys.servicesTitle.tr(),
                  project: Dummy.project,
                  isInverted: true,
                  imagePath: StaticUtils.servicesNetworkImg,
                  showFeature: true,
                  bottomWidget: CustomButton(
                    onPressed: () => locator<AppNavigation>()
                        .navigateTo(AppRoutes.getAQuote),
                    child: Text(
                      LocaleKeys.getAQuote.tr(),
                      style: AppText.b2b!.cl(
                        Colors.white,
                      ),
                    ),
                  ),
                ),
                Space.yf(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StatsCard(
                      text: '100 %',
                      subText:
                          '${LocaleKeys.client.tr()}\n${LocaleKeys.satisfaction.tr()}',
                    ),
                    StatsCard(
                      text: '245 +',
                      subText:
                          '${LocaleKeys.employees.tr()}\n${LocaleKeys.worldwide.tr()}',
                    ),
                    StatsCard(
                      text: '190 +',
                      subText:
                          '${LocaleKeys.projects.tr()}\n${LocaleKeys.completed.tr()}',
                    ),
                  ],
                ),
                Space.yf(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(
                      text: StaticUtils.work,
                      showPadding: true,
                    ),
                    Space.y!,
                    Padding(
                      padding: Space.all(7, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${LocaleKeys.latest.tr()} ',
                                  style: AppText.h1b,
                                ),
                                TextSpan(
                                  text: LocaleKeys.projects.tr(),
                                  style: AppText.h1b!.cl(
                                    AppTheme.c!.primary!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppTextIconButton(
                            onPressed: () {},
                            text:
                                '${LocaleKeys.see.tr()} ${LocaleKeys.projects.tr()}',
                          ),
                        ],
                      ),
                    ),
                    Space.y2!,
                    SizedBox(
                      height: AppDimensions.normalize(150),
                      width: AppDimensions.size!.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: state.data!
                            .where((element) =>
                                element.id != 'aboutus' &&
                                element.id != 'services')
                            .toList()
                            .map((e) => _LatestProjectCard(project: e))
                            .toList(),
                      ),
                    ),
                    Space.y2!,
                    Center(
                      child: SmoothPageIndicator(
                        controller: PageController(),
                        effect: SlideEffect(
                          activeDotColor: AppTheme.c!.primary!,
                          dotColor: const Color(0xff434343),
                        ),
                        count: 3,
                      ),
                    ),
                  ],
                ),
                Space.yf(4),
                Padding(
                  padding: Space.all(11, 0),
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
                const BottomPageMobile(),
              ],
            );
          }
          return const Center(
            child: Text(
              'Something went wrong!',
            ),
          );
        },
      ),
    );
  }
}
