import 'package:flutter/material.dart';
import 'package:poolart/app_routes.dart';
import 'package:poolart/configs/app_dimensions.dart';
import 'package:poolart/configs/app_theme.dart';
import 'package:poolart/configs/space.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/providers/scroll_provider.dart';
import 'package:poolart/services/app_navigation.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/custom_button.dart';

class TabletAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TabletAppBar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.all(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: AppDimensions.size!.width * 0.046,
                height: AppDimensions.size!.width * 0.046,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppTheme.c!.primary,
                ),
                child: IconButton(
                    color: Colors.white,
                    alignment: Alignment.center,
                    padding: Space.all(0.1, 0.1),
                    iconSize: AppDimensions.size!.width * 0.035,
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
              ),
              Padding(
                padding: Space.all(0.1, 0),
                child: Image.asset(
                  StaticUtils.appLogo,
                  height: AppDimensions.size!.width * 0.06,
                ),
              ),
            ],
          ),
          CustomButton(
            child: const Text(
              'Get a Quote',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () =>
                locator<AppNavigation>().navigateTo(AppRoutes.getAQuote),
          ),
        ],
      ),
    );
  }
}
