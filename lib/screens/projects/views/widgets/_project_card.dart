part of '../../projects.dart';

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    Key? key,
    this.isFinal,
    this.imageURL,
    this.title,
    this.description,
  }) : super(key: key);
  final bool? isFinal;
  final String? imageURL;
  final String? title;
  final String? description;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hover = false;

  void setHover(bool value) {
    setState(() {
      hover = !hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !widget.isFinal!
        ? InkWell(
            onTap: () =>
                locator<AppNavigation>().navigateTo(AppRoutes.projectDetails),
            onHover: setHover,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.c!.primary,
                image: DecorationImage(
                  image: NetworkImage(widget.imageURL!),
                  fit: BoxFit.fill,
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
                  if (!hover && widget.imageURL! == 'Yes')
                    Center(
                      child: Text(LocaleKeys.noImage.tr(),
                          style: AppText.h2b!.cl(Colors.white)),
                    ),
                  if (hover) _hoveringEffect()
                ],
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  AppTheme.c!.primary!,
                  BlendMode.lighten,
                ),
                image: NetworkImage(widget.imageURL!),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: AppTextIconButton(
                onPressed: () {},
                text: 'Load More',
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ));
  }

  Widget _hoveringEffect() {
    return Padding(
      padding: Space.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title!,
            style: Responsive.isMobile(context)
                ? AppText.b2b!.cl(Colors.white)
                : AppText.h3b!.cl(Colors.white),
          ),
          Space.y!,
          Text(
            widget.description!,
            style: Responsive.isMobile(context)
                ? AppText.l2!.cl(Colors.white)
                : AppText.l1!.cl(Colors.white),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Space.ym!,
          AppTextIconButton(
            onPressed: () =>
                locator<AppNavigation>().navigateTo(AppRoutes.projectDetails),
            text: '${LocaleKeys.see.tr()} ${LocaleKeys.project.tr()}',
            textStyle: AppText.l1!.cl(
              Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
