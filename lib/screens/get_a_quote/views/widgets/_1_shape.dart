part of '../../get_a_quote.dart';

class _Shape extends StatelessWidget {
  const _Shape({Key? key}) : super(key: key);

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
          LocaleKeys.chooseTheShape.tr(),
          style: AppText.h2b,
        ),
        Space.y1!,
        Expanded(
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            padding: Space.all(),
            mainAxisSpacing: Responsive.isMobile(context)
                ? AppDimensions.normalize(4)
                : AppDimensions.normalize(8),
            crossAxisSpacing: Responsive.isMobile(context)
                ? AppDimensions.normalize(6)
                : AppDimensions.normalize(8),
            crossAxisCount: Responsive.isMobile(context) ? 2 : 3,
            childAspectRatio: Responsive.isMobile(context) ? 1 : 1.2,
            children: StaticUtils.poolShapes
                .map(
                  (e) => InkWell(
                    onTap: () => quote.shape = e['name'],
                    child: Container(
                      decoration: UIProps.boxCard!.copyWith(
                        border: quote.quote.shape.contains(e['name'])
                            ? Border.all(
                                color: AppTheme.c!.primary!,
                                width: AppDimensions.normalize(1),
                              )
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              e['image'],
                              height: AppDimensions.normalize(40),
                            ),
                          ),
                          Space.y!,
                          Text(
                            e['name'],
                            style: AppText.b1b,
                          ),
                          Space.y!,
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
