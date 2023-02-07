part of 'stepper_widget.dart';

class StepWidget extends StatelessWidget {
  final bool isActive;
  final bool isDone;
  final String text;
  final IconData icon;
  final int index;

  const StepWidget({
    Key? key,
    required this.icon,
    required this.isActive,
    required this.isDone,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: Responsive.isMobile(context)
              ? AppDimensions.normalize(15)
              : AppDimensions.normalize(32),
          width: Responsive.isMobile(context)
              ? AppDimensions.normalize(15)
              : AppDimensions.normalize(32),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: UIProps.cardShadow,
            border: Border.all(
              color: isActive || isDone ? AppTheme.c!.primary! : Colors.black87,
              width: 2,
            ),
          ),
          child: Center(
            child: isActive
                ? Icon(
                    icon,
                    size: Responsive.isMobile(context)
                        ? AppDimensions.normalize(9)
                        : AppDimensions.normalize(15),
                    color: isActive ? AppTheme.c!.primary! : Colors.black87,
                  )
                : isDone
                    ? Icon(
                        CommunityMaterialIcons.check,
                        size: Responsive.isMobile(context)
                            ? AppDimensions.normalize(9)
                            : AppDimensions.normalize(15),
                        color: AppTheme.c!.primary!,
                      )
                    : Text(
                        '${index + 1}',
                        style: Responsive.isMobile(context)
                            ? AppText.h3b
                            : AppText.h2b,
                      ),
          ),
        ),
        Space.y!,
        SizedBox(
          width: Responsive.isMobile(context)
              ? AppDimensions.normalize(18.9)
              : AppDimensions.normalize(50),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Responsive.isMobile(context)
                ? AppText.l2!.cl(
                    isActive || isDone ? AppTheme.c!.primary! : Colors.black87,
                  )
                : AppText.l1!.cl(
                    isActive || isDone ? AppTheme.c!.primary! : Colors.black87,
                  ),
          ),
        )
      ],
    );
  }
}
