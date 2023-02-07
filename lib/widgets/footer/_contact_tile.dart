part of 'footer.dart';

class _ContactTile extends StatelessWidget {
  final String title;
  final String subTitle;
  const _ContactTile({Key? key, required this.subTitle, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Space.y1!,
        Text(
          title,
          style: MediaQuery.of(context).size.width <= 600
              ? AppText.l1!.copyWith(
                  color: AppTheme.c!.primary,
                  fontWeight: FontWeight.w600,
                )
              : AppText.b2!.copyWith(
                  color: AppTheme.c!.primary,
                  fontWeight: FontWeight.w600,
                ),
        ),
        Text(
          subTitle,
          style: MediaQuery.of(context).size.width <= 600
              ? AppText.l2!.copyWith(
                  color: AppTheme.c!.text,
                  fontWeight: FontWeight.w500,
                )
              : AppText.l1!.copyWith(
                  color: AppTheme.c!.text,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ],
    );
  }
}
