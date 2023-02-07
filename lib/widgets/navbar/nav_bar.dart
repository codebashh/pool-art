import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:poolart/app_routes.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/providers/scroll_provider.dart';
import 'package:poolart/services/app_navigation.dart';
import 'package:poolart/utils/navbar_utils.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/custom_button.dart';
import 'package:provider/provider.dart';

part '_navbar_action.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final scroll = Provider.of<ScrollProvider>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: scroll.scroll ? Colors.white : Colors.transparent,
      padding: Space.v!,
      child: Row(
        children: [
          MediaQuery.of(context).size.width <= 1100 ? Space.xf(2) : Space.xf(4),
          Container(
            color: AppTheme.c!.primary,
            padding: Space.all(0.15),
            child: Image.asset(
              height: AppDimensions.normalize(11),
              width: AppDimensions.normalize(11),
              StaticUtils.appLogo2,
              fit: BoxFit.cover,
              color: Colors.white,
            ),
          ),
          Space.x1!,
          Text(
            'Pool\'Art',
            style: AppText.h2b!.cl(AppTheme.c!.primary!),
          ),
          const Spacer(),
          ...NavBarUtils.names.asMap().entries.map(
            (e) {
              return _NavBarActionButton(
                label: e.value['label'],
                isActive: currentRoute == e.value['path'],
                path: e.value['path'],
              );
            },
          ),
          Space.x1!,
          CustomButton(
            onPressed: () =>
                locator<AppNavigation>().navigateTo(AppRoutes.getAQuote),
            child: Text(
              LocaleKeys.getAQuote.tr(),
              style: AppText.l1b!.copyWith(
                color: AppTheme.c!.background,
              ),
            ),
          ),
          MediaQuery.of(context).size.width <= 1100 ? Space.xf(2) : Space.xf(4),
        ],
      ),
    );
  }
}
