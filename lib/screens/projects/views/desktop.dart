part of '../projects.dart';

class Desktop extends StatelessWidget {
  final ScrollController controller;
  const Desktop({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);

    App.init(context);

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
          } else {
            final projectsList = appProv.tabIndex == 0
                ? state.data!
                : appProv.tabIndex == 1
                    ? state.data!
                        .where((element) => element.isConstruction == true)
                        .toList()
                    : state.data!
                        .where((element) => element.isRenovation == true)
                        .toList();

            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.normalize(40),
                      left: AppDimensions.normalize(25)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: AppDimensions.normalize(10),
                            child: VerticalDivider(
                              thickness: AppDimensions.normalize(1),
                              color: AppTheme.c!.primary,
                            ),
                          ),
                          Space.x!,
                          Text(
                            LocaleKeys.projects.tr().toUpperCase(),
                            style: AppText.h3b!
                                .copyWith(color: AppTheme.c!.primary),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${LocaleKeys.our.tr()} ', style: AppText.h1b),
                          Text(LocaleKeys.projects.tr(),
                              style: AppText.h1b!
                                  .copyWith(color: AppTheme.c!.primary)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: Space.all(7.2, 0.3),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _ProjectsTabButton(label: LocaleKeys.all.tr(), index: 0),
                      _ProjectsTabButton(
                          label: LocaleKeys.construction.tr(), index: 1),
                      _ProjectsTabButton(
                          label: LocaleKeys.renovation.tr(), index: 2),
                    ],
                  ),
                ),
                _ProjectsList(list: projectsList),
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
                      FontAwesomeIcons.shopify
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
            );
          }
        },
      ),
    );
  }
}
