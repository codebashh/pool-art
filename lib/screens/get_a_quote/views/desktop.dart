part of '../get_a_quote.dart';

class Desktop extends StatelessWidget {
  final ScrollController controller;
  const Desktop({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final quote = Provider.of<QuoteProvider>(context);

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Space.yf(8),
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: Text(
                  LocaleKeys.getAQuoteTitle.tr().toUpperCase(),
                  style: AppText.h1b,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
            ],
          ),
          Space.yf(3),
          const StepperWidget(),
          Space.yf(3),
          SizedBox(
            height: AppDimensions.normalize(220),
            child: Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: PageView(
                    onPageChanged: (value) => quote.step = value,
                    controller: quote.controller,
                    children: const [
                      _Shape(),
                      _Dimensions(),
                      _Depth(),
                      _Color(),
                      _SendRequest(),
                    ],
                  ),
                ),
                Space.xf(5),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: MediaQuery.of(context).size.width <= 1100
                            ? Space.all()
                            : Space.all(1),
                        decoration: UIProps.boxCard!,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Space.y!,
                            Text(
                              LocaleKeys.yourPool.tr(),
                              style: AppText.h2b,
                            ),
                            Space.y1!,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: StaticUtils.steps[0].isDone
                                      ? AppTheme.c!.primary
                                      : Colors.grey,
                                ),
                                Space.x!,
                                Text(
                                  quote.quote.shape,
                                  style: AppText.b2b,
                                )
                              ],
                            ),
                            Space.y1!,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: StaticUtils.steps[1].isDone
                                      ? AppTheme.c!.primary
                                      : Colors.grey,
                                ),
                                Space.x!,
                                Text(
                                  '${LocaleKeys.size.tr()}: ${quote.quote.length}m x ${quote.quote.width}m',
                                  style: AppText.b2b,
                                )
                              ],
                            ),
                            Space.y1!,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: StaticUtils.steps[2].isDone
                                      ? AppTheme.c!.primary
                                      : Colors.grey,
                                ),
                                Space.x!,
                                Expanded(
                                  child: Text(
                                    quote.quote.depth,
                                    style: AppText.b2b,
                                  ),
                                )
                              ],
                            ),
                            Space.y1!,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: StaticUtils.steps[3].isDone
                                      ? AppTheme.c!.primary
                                      : Colors.grey,
                                ),
                                Space.x!,
                                Text(
                                  quote.quote.color,
                                  style: AppText.b2b,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Space.y!,
                      CustomButton(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            LocaleKeys.nextStep.tr(),
                            style: AppText.l1!.cl(
                              Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (quote.step < StaticUtils.steps.length - 1) {
                            StaticUtils.steps[quote.step].isDone = true;
                            quote.controller.nextPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeInOut,
                            );
                            quote.step++;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const BottomPage(),
        ],
      ),
    );
  }
}
// Space.x2!,
