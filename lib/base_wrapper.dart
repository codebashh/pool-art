import 'dart:math';

import 'package:poolart/app_routes.dart';
import 'package:poolart/configs/app.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/providers/scroll_provider.dart';
import 'package:poolart/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:poolart/services/app_navigation.dart';
import 'package:poolart/utils/navbar_utils.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/custom_button.dart';
import 'package:poolart/widgets/drawer/mobile_drawer/drawer_items.dart';
import 'package:poolart/widgets/drawer/tablet_drawer/tablet_app_bar.dart';
import 'package:poolart/widgets/drawer/tablet_drawer/drawer.dart';
import 'package:poolart/widgets/navbar/nav_bar.dart';
import 'package:provider/provider.dart';

class BaseWrapper extends StatefulWidget {
  final Widget child;
  const BaseWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<BaseWrapper> createState() => _BaseWrapperState();
}

class _BaseWrapperState extends State<BaseWrapper> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    App.init(context);
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final scroll = Provider.of<ScrollProvider>(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: Responsive.isTablet(context) ? const TabletDrawer() : null,
      key: Responsive.isTablet(context) ? scaffoldKey : null,
      body: Stack(
        children: [
          if (Responsive.isMobile(context)) ...[
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
          ],
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
                child: Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: value == 0 ? 1.0 : 0.5,
                      duration: const Duration(milliseconds: 300),
                      child: widget.child,
                    ),
                    if (Responsive.isMobile(context))
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        color:
                            scroll.scroll ? Colors.white : Colors.transparent,
                        padding: Space.all(0.5),
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
                                onPressed: () {
                                  Navigator.pop(context);
                                  locator<AppNavigation>()
                                      .navigateTo(AppRoutes.getAQuote);
                                }),
                          ],
                        ),
                      ),
                  ],
                ),
              ));
            },
          ),
          if (Responsive.isTablet(context)) ...[
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: scroll.scroll ? Colors.white : Colors.transparent,
              child: TabletAppBar(
                scaffoldKey: scaffoldKey,
              ),
            ),
          ],
          if (Responsive.isDesktop(context)) const AppNavBar(),
        ],
      ),
    );
  }
}
