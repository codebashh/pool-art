part of '../../get_a_quote.dart';

class _DepthMobile extends StatelessWidget {
  const _DepthMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quote = Provider.of<QuoteProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Label(
          text: 'YOUR POOL',
        ),
        Text(
          'Choose the depth of the pool',
          style: AppText.h2b,
        ),
        Space.y1!,
        Expanded(
          child: Column(
            children: StaticUtils.poolDepths.map(
              (element) {
                List<int> features = element['features'];

                return Expanded(
                  child: InkWell(
                    onTap: () => quote.depth = element['name'],
                    child: Container(
                      margin: Space.all(),
                      decoration: UIProps.boxCard!.copyWith(
                        borderRadius: BorderRadius.circular(4),
                        border: quote.quote.depth.contains(element['name'])
                            ? Border.all(
                                color: AppTheme.c!.primary!,
                                width: AppDimensions.normalize(1),
                              )
                            : null,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: Space.all(0.5),
                              child: Text(
                                element['name'],
                                style: AppText.b2b,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: _features(features, 'Swim')),
                                Expanded(child: _features(features, 'Dip')),
                                Expanded(child: _features(features, 'Enjoy')),
                                Expanded(
                                  flex: 2,
                                  child: Image.asset(
                                    element['image'],
                                    height: AppDimensions.normalize(40),
                                  ),
                                ),
                              ],
                            ),
                          ),
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

  Widget _features(List<int> features, String? text) {
    return Column(
      children: [
        Text(
          text!,
          style: AppText.b2b,
        ),
        Space.y!,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${features[0]}',
              style: AppText.l2b,
            ),
            Space.x!,
            Icon(
              Icons.star,
              color: AppTheme.c!.primary,
              size: AppDimensions.normalize(6),
            ),
          ],
        ),
      ],
    );
  }
}
