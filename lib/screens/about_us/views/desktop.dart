part of '../about_us.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Space.yf(8),
          BlocBuilder<ProjectsCubit, ProjectsState>(
            builder: (context, state) {
              if (state is ProjectsFetchLoading) {
                return const LinearProgressIndicator();
              } else if (state is ProjectsFetchFailed) {
                return Text(state.message!);
              } else if (state is ProjectsFetchSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                  ],
                );
              }
              return const Text('Something went wrong!');
            },
          ),
          const BottomPage(),
        ],
      ),
    );
  }
}
