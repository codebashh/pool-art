part of '../../product_details.dart';

class ProductDetailsCard extends StatelessWidget {
  final Product product;
  final bool isInverted;
  final String? title;
  final String? imagePath;
  final Widget? bottomWidget;
  final bool showFeature;
  const ProductDetailsCard({
    Key? key,
    required this.product,
    required this.isInverted,
    this.title,
    required this.imagePath,
    this.bottomWidget,
    this.showFeature = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    ScreenUtil.init(context, designSize: const Size(1440, 980));

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.525,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isInverted) const Spacer(),
          if (isInverted && imagePath != null)
            ImageStackCard(
              isInverted: isInverted,
              imagePath: imagePath!,
            ),
          if (MediaQuery.of(context).size.width >= 1500)
            const Spacer()
          else
            SizedBox(
              width: AppDimensions.normalize(25),
            ),
          Expanded(
            flex: MediaQuery.of(context).size.width <= 1250 ? 3 : 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  text: title ?? product.name,
                ),
                Space.y1!,
                Text(
                  product.title,
                  style: MediaQuery.of(context).size.width <= 1200
                      ? AppText.h2b!.copyWith(
                          height: 1.1,
                        )
                      : AppText.h1b!.copyWith(
                          height: 1.1,
                        ),
                ),
                Text(
                  product.description,
                  style: AppText.l1,
                ),
                if (bottomWidget != null) ...[
                  Space.y!,
                  bottomWidget!,
                ],
              ],
            ),
          ),
          const Spacer(),
          if (!isInverted && imagePath != null) ...[
            ImageStackCard(
              isInverted: isInverted,
              imagePath: imagePath!,
            ),
            if (MediaQuery.of(context).size.width >= 1500)
              const Spacer()
            else
              SizedBox(
                width: AppDimensions.normalize(25),
              ),
          ],
        ],
      ),
    );
  }
}
