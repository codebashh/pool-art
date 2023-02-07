// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../product_details.dart';

class Mobile extends StatelessWidget {
  final ScrollController controller;

  const Mobile({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context,
        designSize: const Size(1440, 980), splitScreenMode: true);
    return Padding(
      padding: Space.all(0.5, 0),
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.yf(8),
            const Label(
              text: 'PRODUCT',
            ),
            Space.y!,
            Text(
              'Adheesa panaragama',
              style: AppText.h2b,
            ),
            Space.y!,
            Row(
              children: [
                SizedBox(
                  height: AppDimensions.size!.height * 0.45,
                  width: AppDimensions.size!.width * 0.5,
                  child: Image.asset(
                    StaticUtils.aboutUsImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Space.x1!,
                Column(
                  children: [
                    SizedBox(
                      width: AppDimensions.normalize(60),
                      child: Text(
                        '3 ranges to choose from: Classic and Tradition: reconstituted stones for a classic and authentic style Porcelain stoneware for a contemporary style.',
                        style: AppText.b1,
                      ),
                    ),
                    Space.y!,
                    CustomButton(
                      onPressed: () {},
                      width: AppDimensions.size!.width * 0.25,
                      child: Center(
                        child: Text(
                          'ADD',
                          style: AppText.l2!.cl(
                            AppTheme.c!.background!,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Space.y!,
              ],
            ),
            const BottomPageMobile(),
          ],
        ),
      ),
    );
  }
}
