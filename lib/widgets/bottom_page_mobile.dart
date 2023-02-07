import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poolart/app_routes.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/cubits/products/cubit.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/services/app_navigation.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/app_text_icon_button.dart';
import 'package:poolart/widgets/footer/footer.dart';
import 'package:poolart/widgets/label.dart';

class BottomPageMobile extends StatelessWidget {
  const BottomPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Space.y2!,
        const Label(
          text: StaticUtils.product,
          showPadding: true,
        ),
        Space.y!,
        Padding(
          padding: Space.hf(0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Our ',
                      style: AppText.b2b!.cl(
                        AppTheme.c!.textSub!,
                      ),
                    ),
                    TextSpan(
                      text: 'Products',
                      style: AppText.b2b!.cl(
                        AppTheme.c!.primary!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Space.y1!,
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsFetchLoading) {
              return const LinearProgressIndicator();
            }
            if (state is ProductsFetchFailed) {
              return Center(
                child: Text(state.message!),
              );
            } else {
              return SizedBox(
                height: AppDimensions.size!.height * 0.35,
                child: ListView(
                  padding: Space.v,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...state.data!.map(
                          (product) => Container(
                            width: 470.w,
                            margin: Space.h,
                            decoration: UIProps.boxCard,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: AppText.l1b,
                                        ),
                                        Space.y1!,
                                        Text(
                                          product.description,
                                          style: AppText.l2,
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: Space.all(0.5),
                                  child: AppTextIconButton(
                                    onPressed: () {
                                      locator<AppNavigation>().navigateTo(
                                        AppRoutes.productDetailScreen,
                                      );
                                    },
                                    text: 'See Product',
                                    textStyle: AppText.l2!.cl(
                                      AppTheme.c!.primary!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
        Space.y1!,
        const FooterMobile(),
      ],
    );
  }
}
