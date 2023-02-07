part of '../../get_a_quote.dart';

class _Depth extends StatelessWidget {
  const _Depth({Key? key}) : super(key: key);

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
          LocaleKeys.chooseTheDepth.tr(),
          style: AppText.h2b,
        ),
        Space.y1!,
        Expanded(
          child: Row(
            children: StaticUtils.poolDepths.map(
              (e) {
                List<int> features = e['features'];

                return Expanded(
                  child: InkWell(
                    onTap: () => quote.depth = e['name'],
                    child: Container(
                      margin: Space.all(),
                      decoration: UIProps.boxCard!.copyWith(
                        border: quote.quote.depth.contains(e['name'])
                            ? Border.all(
                                color: AppTheme.c!.primary!,
                                width: AppDimensions.normalize(1),
                              )
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            e['image'],
                            height: AppDimensions.normalize(50),
                          ),
                          Space.y!,
                          Padding(
                            padding: Space.h!,
                            child: Text(
                              e['name'],
                              style: AppText.b1b,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Space.y1!,
                          ...features.asMap().entries.map((e) {
                            String feature = e.key == 0
                                ? LocaleKeys.swim.tr()
                                : e.key == 1
                                    ? LocaleKeys.dip.tr()
                                    : LocaleKeys.enjoy.tr();

                            return Padding(
                              padding: Space.all(1, 0.5),
                              child: Row(
                                children: [
                                  Text(
                                    feature,
                                    style: AppText.l1b,
                                  ),
                                  const Spacer(),
                                  Text(
                                    e.value.toString(),
                                    style: AppText.l1b,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: AppTheme.c!.primary,
                                    size: AppDimensions.normalize(8),
                                  )
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        )
      ],
    );
  }
}
