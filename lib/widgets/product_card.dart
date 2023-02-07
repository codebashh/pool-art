import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poolart/app_routes.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/models/product.dart';
import 'package:poolart/services/app_navigation.dart';
import 'package:poolart/widgets/app_text_icon_button.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(1440, 980), splitScreenMode: true);

    return Container(
      width: 265.w,
      height: 470.h,
      margin: Space.h1,
      decoration: UIProps.boxCard,
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.images.first,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Space.y!,
          Expanded(
            child: Padding(
              padding: Space.h!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: AppText.h2b,
                  ),
                  Text(
                    product.description,
                    style: AppText.l1!,
                  ),
                  const Spacer(),
                  AppTextIconButton(
                    onPressed: () => locator<AppNavigation>()
                        .navigateTo(AppRoutes.productDetailScreen),
                    text: '${LocaleKeys.see.tr()} ${LocaleKeys.product.tr()}',
                    textStyle: AppText.l1!.cl(
                      AppTheme.c!.primary!,
                    ),
                  ),
                  Space.y1!,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
