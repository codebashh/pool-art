part of '../get_a_quote.dart';

class Mobile extends StatelessWidget {
  final ScrollController controller;
  const Mobile({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final quote = Provider.of<QuoteProvider>(context);

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Space.yf(2),
          Row(
            children: [
              Space.xf(2),
              Expanded(
                child: Text(
                  'GET QUOTE OF YOUR\nPOOL PROJECT IN FEW STEPS.',
                  style: AppText.h2b,
                  textAlign: TextAlign.center,
                ),
              ),
              Space.xf(2),
            ],
          ),
          Space.yf(2),
          const StepperWidget(),
          Space.yf(2),
          SizedBox(
            height: quote.step == 1
                ? AppDimensions.normalize(120)
                : quote.step == 2 || quote.step == 4
                    ? AppDimensions.normalize(180)
                    : AppDimensions.normalize(260),
            child: Row(
              children: [
                Space.xf(0.7),
                Expanded(
                  child: PageView(
                    onPageChanged: (value) => quote.step = value,
                    controller: quote.controller,
                    children: const [
                      _Shape(),
                      _Dimensions(),
                      _DepthMobile(),
                      _Color(),
                      _SendRequest(),
                    ],
                  ),
                ),
                Space.xf(0.7),
              ],
            ),
          ),
          Padding(
            padding: Space.all(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: AppTheme.c!.primary,
                  width: double.infinity,
                  height: AppDimensions.normalize(4),
                ),
                Container(
                  padding: Space.all(0.5),
                  decoration: UIProps.boxCard!.copyWith(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Space.y!,
                      Text(
                        'Your Pool',
                        style: AppText.h2b,
                      ),
                      Space.y1!,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                Space.y!,
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: StaticUtils.steps[1].isDone
                                          ? AppTheme.c!.primary
                                          : Colors.grey,
                                    ),
                                    Space.x!,
                                    Text(
                                      'Size: ${quote.quote.length}m x ${quote.quote.width}m',
                                      style: AppText.b2b,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
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
                                Space.y!,
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: StaticUtils.steps[3].isDone
                                          ? AppTheme.c!.primary
                                          : Colors.grey,
                                    ),
                                    Space.x!,
                                    Expanded(
                                      child: Text(
                                        quote.quote.color,
                                        style: AppText.b2b,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Space.y2!,
                CustomButton(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Next Step',
                      style: AppText.b1!.cl(
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
          const BottomPageMobile(),
        ],
      ),
    );
  }
}
