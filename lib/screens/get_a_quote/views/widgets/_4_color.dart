part of '../../get_a_quote.dart';

class _Color extends StatelessWidget {
  const _Color({Key? key}) : super(key: key);

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
          LocaleKeys.chooseTheColor.tr(),
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
                ? AppDimensions.normalize(5)
                : AppDimensions.normalize(8),
            crossAxisCount: Responsive.isMobile(context) ? 2 : 3,
            childAspectRatio: Responsive.isMobile(context) ? 1.1 : 1.35,
            children: StaticUtils.poolColors
                .map(
                  (e) => InkWell(
                    onTap: () => quote.color = e['name'],
                    child: Container(
                      decoration: UIProps.boxCard!.copyWith(
                        border: quote.quote.color.contains(e['name'])
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
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(e['image']),
                                fit: BoxFit.cover,
                              )),
                            ),
                          ),
                          Space.y!,
                          if (!Responsive.isMobile(context))
                            Text(
                              e['name'],
                              style: Responsive.isMobile(context)
                                  ? AppText.b2b
                                  : AppText.b1b,
                              textAlign: TextAlign.center,
                            ),
                          if (Responsive.isMobile(context))
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: AppDimensions.normalize(10),
                                  height: AppDimensions.normalize(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black45,
                                    ),
                                    color: e['argb'],
                                    borderRadius: BorderRadius.circular(
                                      AppDimensions.normalize(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.normalize(40),
                                  child: Text(
                                    e['name'],
                                    style: Responsive.isMobile(context)
                                        ? AppText.b2b
                                        : AppText.b1b,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
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
