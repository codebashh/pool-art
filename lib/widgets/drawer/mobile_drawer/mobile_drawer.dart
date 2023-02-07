import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poolart/app_routes.dart';
import 'package:poolart/configs/app_dimensions.dart';
import 'package:poolart/configs/app_theme.dart';
import 'package:poolart/configs/space.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/services/app_navigation.dart';
import 'package:poolart/utils/navbar_utils.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/custom_button.dart';
import 'package:poolart/widgets/drawer/mobile_drawer/drawer_items.dart';

class MobileDrawer extends StatefulWidget {
  final Widget screen;
  const MobileDrawer({Key? key, required this.screen}) : super(key: key);

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: AppDimensions.size!.height * 0.3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(75, 196, 222, 1),
                  Color.fromRGBO(75, 196, 222, 0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: Space.all(1.5, 1),
                child: Image.asset(
                  StaticUtils.appLogo,
                  height: AppDimensions.normalize(50),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: AppDimensions.size!.height * 0.3),
              child: ListView(
                children: [
                  ...NavBarUtils.names.asMap().entries.map(
                    (e) {
                      return MobileDrawerItem(
                        label: e.value['label'],
                        isActive: currentRoute == e.value['path'],
                        path: e.value['path'],
                        icon: e.value['icon'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(milliseconds: 300),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, AppDimensions.size!.width * 0.75 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                  body: Stack(
                    children: [
                      AnimatedOpacity(
                        opacity: value == 0 ? 1.0 : 0.5,
                        duration: const Duration(milliseconds: 300),
                        child: widget.screen,
                      ),
                      Padding(
                        padding: Space.all(0.5, 0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: AppDimensions.size!.width * 0.07,
                                  height: AppDimensions.size!.width * 0.07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppTheme.c!.primary,
                                  ),
                                  child: IconButton(
                                      padding: Space.all(0.1, 0.1),
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      iconSize:
                                          AppDimensions.size!.width * 0.05,
                                      onPressed: () {
                                        setState(() {
                                          value == 0 ? value = 1 : value = 0;
                                        });
                                      },
                                      icon: const Icon(Icons.menu)),
                                ),
                                Padding(
                                  padding: Space.all(0.1, 0),
                                  child: Image.asset(
                                    StaticUtils.appLogo,
                                    height: AppDimensions.size!.width * 0.09,
                                  ),
                                ),
                              ],
                            ),
                            CustomButton(
                              child: const Text(
                                'Get a Quote',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () => locator<AppNavigation>()
                                  .navigateTo(AppRoutes.getAQuote),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}
