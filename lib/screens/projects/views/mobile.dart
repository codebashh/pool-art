part of '../projects.dart';

class Mobile extends StatelessWidget {
  final ScrollController controller;
  const Mobile({Key? key, required this.controller}) : super(key: key);

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
                      top: AppDimensions.normalize(15),
                      left: AppDimensions.normalize(8.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.y2!,
                      Row(
                        children: [
                          SizedBox(
                            height: AppDimensions.normalize(8),
                            child: VerticalDivider(
                              thickness: AppDimensions.normalize(1),
                              color: AppTheme.c!.primary,
                            ),
                          ),
                          Space.x!,
                          Text(
                            'PROJECTS',
                            style: AppText.b2b!.copyWith(
                              color: AppTheme.c!.primary,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Our ', style: AppText.h2b),
                          Text('Projects',
                              style: AppText.h2b!
                                  .copyWith(color: AppTheme.c!.primary)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: Space.all(0.2, 0.5),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      _ProjectsTabButton(label: 'All', index: 0),
                      _ProjectsTabButton(label: 'Construction', index: 1),
                      _ProjectsTabButton(label: 'Renovation', index: 2),
                    ],
                  ),
                ),
                Padding(
                  padding: Space.all(0.8),
                  child: _ProjectsList(list: projectsList),
                ),
                Space.yf(2),
                const BottomPageMobile(),
              ],
            );
          }
        },
      ),
    );
  }
}
