part of 'nav_bar.dart';

class _NavBarActionButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final String path;
  const _NavBarActionButton({
    Key? key,
    required this.label,
    required this.isActive,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => locator<AppNavigation>().navigateTo(path),
      child: Container(
        padding: Space.all(0.5, 0.45),
        margin: Space.h1!,
        decoration: BoxDecoration(
          border: Border(
            bottom: isActive
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
          label.toUpperCase(),
          style: AppText.b2b!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isActive ? AppTheme.c!.primary : null,
          ),
        ),
      ),
    );
  }
}
