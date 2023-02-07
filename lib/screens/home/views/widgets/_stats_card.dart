// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../home.dart';

class StatsCard extends StatelessWidget {
  final String text;
  final String subText;
  const StatsCard({
    Key? key,
    required this.text,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height <= 600
          ? AppDimensions.size!.height * 0.07
          : AppDimensions.normalize(30),
      child: Row(
        children: [
          Text(
            text,
            style: MediaQuery.of(context).size.width <= 600
                ? AppText.l2b!.copyWith(
                    color: AppTheme.c!.primary,
                  )
                : AppText.h1b!.copyWith(
                    color: AppTheme.c!.primary,
                  ),
          ),
          Space.x!,
          Container(
            decoration: BoxDecoration(
              color: AppTheme.c!.primary,
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            height: MediaQuery.of(context).size.width <= 600
                ? AppDimensions.normalize(10)
                : AppDimensions.normalize(20),
            width: AppDimensions.normalize(1),
          ),
          Space.x!,
          Text(
            subText,
            style: MediaQuery.of(context).size.width <= 600
                ? AppText.l2!.copyWith(
                    fontWeight: FontWeight.w600,
                  )
                : AppText.b1!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ],
      ),
    );
  }
}
