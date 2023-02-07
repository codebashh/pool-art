import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/cubits/products/cubit.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:poolart/widgets/app_text_icon_button.dart';
import 'package:poolart/widgets/footer/footer.dart';
import 'package:poolart/widgets/label.dart';
import 'package:poolart/widgets/product_card.dart';

class BottomPage extends StatelessWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Space.yf(4),
        Label(
          text: LocaleKeys.products.tr(),
          showPadding: true,
        ),
        Padding(
          padding: Space.hf(7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${LocaleKeys.our.tr()} ',
                      style: AppText.h1b,
                    ),
                    TextSpan(
                      text: LocaleKeys.products.tr(),
                      style: AppText.h1b!.cl(
                        AppTheme.c!.primary!,
                      ),
                    ),
                  ],
                ),
              ),
              AppTextIconButton(
                onPressed: () {},
                text: '${LocaleKeys.see.tr()} ${LocaleKeys.products.tr()}',
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
              return Row(
                children: [
                  const Spacer(),
                  ...state.data!.map(
                    (product) => ProductCard(
                      product: product,
                    ),
                  ),
                  const Spacer(),
                ],
              );
            }
          },
        ),
        const Footer(),
      ],
    );
  }
}
