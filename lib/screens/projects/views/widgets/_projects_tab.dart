part of '../../projects.dart';

class _ProjectsTabButton extends StatelessWidget {
  final String label;
  final int index;
  const _ProjectsTabButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () => appProv.tabIndex = index,
      child: Container(
        padding: Responsive.isMobile(context)
            ? Space.all(0.1, 0.4)
            : Space.all(0.5, 0.45),
        margin: Space.h1!,
        decoration: BoxDecoration(
          border: Border(
            bottom: appProv.tabIndex == index
                ? BorderSide(
                    color: AppTheme.c!.primary!,
                    width: 3,
                  )
                : const BorderSide(
                    color: Colors.transparent,
                    width: 2,
                  ),
          ),
        ),
        child: Text(
          label,
          style: Responsive.isMobile(context)
              ? AppText.b2b!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: appProv.tabIndex == index ? AppTheme.c!.primary : null,
                )
              : AppText.b2b!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: appProv.tabIndex == index ? AppTheme.c!.primary : null,
                ),
        ),
      ),
    );
  }
}
