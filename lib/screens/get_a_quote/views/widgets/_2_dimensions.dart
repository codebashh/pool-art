part of '../../get_a_quote.dart';

class _Dimensions extends StatelessWidget {
  const _Dimensions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quote = Provider.of<QuoteProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Label(
          text: LocaleKeys.yourPool.tr().toUpperCase(),
        ),
        Text(
          LocaleKeys.chooseTheDimensions.tr(),
          style: Responsive.isMobile(context) ? AppText.h3b : AppText.h2b,
        ),
        Space.y1!,
        Text(
          LocaleKeys.length.tr(),
          style: AppText.b2b,
        ),
        Space.y1!,
        Wrap(
          spacing: Responsive.isMobile(context)
              ? AppDimensions.normalize(3)
              : AppDimensions.normalize(5),
          runSpacing: Responsive.isMobile(context)
              ? AppDimensions.normalize(3)
              : AppDimensions.normalize(5),
          children: [
            for (int i = 3; i < 9; i++)
              InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => quote.len = i,
                child: Container(
                  height: Responsive.isMobile(context)
                      ? AppDimensions.normalize(15)
                      : AppDimensions.normalize(25),
                  width: Responsive.isMobile(context)
                      ? AppDimensions.normalize(15)
                      : AppDimensions.normalize(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: UIProps.cardShadow,
                    border: Border.all(
                      color: quote.quote.length == i
                          ? AppTheme.c!.primary!
                          : Colors.black87,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$i',
                      style: AppText.h3b,
                    ),
                  ),
                ),
              )
          ],
        ),
        Space.yf(3),
        Text(
          LocaleKeys.width.tr(),
          style: AppText.b2b,
        ),
        Space.y1!,
        Wrap(
          spacing: Responsive.isMobile(context)
              ? AppDimensions.normalize(3)
              : AppDimensions.normalize(5),
          runSpacing: Responsive.isMobile(context)
              ? AppDimensions.normalize(3)
              : AppDimensions.normalize(5),
          children: [
            for (int i = 3; i <= 9; i++)
              InkWell(
                onTap: () => quote.width = i,
                child: Container(
                  height: Responsive.isMobile(context)
                      ? AppDimensions.normalize(15)
                      : AppDimensions.normalize(20),
                  width: Responsive.isMobile(context)
                      ? AppDimensions.normalize(15)
                      : AppDimensions.normalize(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: UIProps.cardShadow,
                    border: Border.all(
                      color: quote.quote.width == i
                          ? AppTheme.c!.primary!
                          : Colors.black87,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$i',
                      style: AppText.h3b,
                    ),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
