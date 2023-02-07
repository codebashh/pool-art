part of '../../home.dart';

class _LatestProjectCard extends StatefulWidget {
  final Project project;
  const _LatestProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<_LatestProjectCard> createState() => _LatestProjectCardState();
}

class _LatestProjectCardState extends State<_LatestProjectCard> {
  bool hover = false;

  void hovering(bool value) {
    setState(() {
      hover = !hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: hovering,
      child: Container(
        margin: Space.h,
        height: double.infinity,
        width: AppDimensions.normalize(120),
        decoration: UIProps.boxCard!.copyWith(
          image: DecorationImage(
            image: NetworkImage(
              widget.project.images.last,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: double.infinity,
              width: double.infinity,
              color: hover
                  ? AppTheme.c!.primary!.withAlpha(200)
                  : Colors.transparent,
            ),
            if (hover)
              Padding(
                padding: Space.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: AppText.h2b!.cl(
                        Colors.white,
                      ),
                    ),
                    Space.y!,
                    Text(
                      widget.project.description,
                      style: AppText.l1!.cl(
                        Colors.white,
                      ),
                    ),
                    const Spacer(),
                    AppTextIconButton(
                      onPressed: () => locator<AppNavigation>()
                          .navigateTo(AppRoutes.projectDetails),
                      text: '${LocaleKeys.see.tr()} ${LocaleKeys.project.tr()}',
                      textStyle: AppText.l1!.cl(
                        Colors.white,
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
