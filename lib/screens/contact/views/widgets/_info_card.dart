part of '../../contact.dart';

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String info;
  const _InfoCard(
      {Key? key, required this.icon, required this.info, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Responsive.isMobile(context) ? null : Space.h2,
      height: Responsive.isMobile(context)
          ? AppDimensions.normalize(85)
          : AppDimensions.normalize(100),
      width: Responsive.isMobile(context)
          ? AppDimensions.normalize(65)
          : AppDimensions.normalize(80),
      decoration: UIProps.boxCard!.copyWith(
        color: AppTheme.c!.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: AppDimensions.normalize(15),
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              color: AppTheme.c!.primary,
              size: AppDimensions.normalize(12),
            ),
          ),
          Space.y1!,
          Text(
            title,
            style: AppText.b1b!.cl(
              Colors.white,
            ),
          ),
          Text(
            info,
            style: AppText.l1!.cl(
              Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
