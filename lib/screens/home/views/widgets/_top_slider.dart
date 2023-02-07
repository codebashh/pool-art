part of '../../home.dart';

class _TopSlider extends StatefulWidget {
  final List<Project> projects;

  const _TopSlider({
    Key? key,
    required this.projects,
  }) : super(key: key);

  @override
  State<_TopSlider> createState() => _TopSliderState();
}

class _TopSliderState extends State<_TopSlider> {
  Project currentProject = Dummy.project;

  @override
  void initState() {
    super.initState();
    currentProject = widget.projects.first;
  }

  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);

    return SizedBox(
      height: AppDimensions.size!.height * 0.95,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: double.infinity,
            child: CarouselSlider(
              carouselController: appProv.controller,
              items: widget.projects
                  .asMap()
                  .entries
                  .map(
                    (e) => CachedNetworkImage(
                      imageUrl: e.value.images.first,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reas) {
                  setState(() {
                    currentProject = widget.projects[index];
                  });
                },
                autoPlayCurve: Curves.linearToEaseOut,
                autoPlayAnimationDuration: const Duration(
                  milliseconds: 700,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.centerRight,
                begin: Alignment.centerLeft,
                colors: [
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
              ),
              SectionCard(
                project: currentProject,
                isInverted: false,
                imagePath: null,
                bottomWidget: AppTextIconButton(
                  onPressed: () {},
                  text: '${LocaleKeys.see.tr()} ${LocaleKeys.projects.tr()}',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.c!.background!),
                    ),
                    child: IconButton(
                      onPressed: () => appProv.controller.previousPage(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.linearToEaseOut,
                      ),
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppTheme.c!.background,
                      ),
                    ),
                  ),
                  Space.x1!,
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.c!.background!),
                    ),
                    child: IconButton(
                      onPressed: () => appProv.controller.nextPage(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.linearToEaseOut,
                      ),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: AppTheme.c!.background,
                      ),
                    ),
                  ),
                  Space.xf(3),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
