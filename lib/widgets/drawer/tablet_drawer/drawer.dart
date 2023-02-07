import 'package:flutter/material.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/services/app_navigation.dart';
import 'package:poolart/utils/navbar_utils.dart';
import 'package:poolart/providers/provider.dart';
import 'package:provider/provider.dart';

class TabletDrawer extends StatelessWidget {
  const TabletDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;

    return SizedBox(
      width: isCollapsed
          ? AppDimensions.size!.width * 0.1
          : AppDimensions.size!.width * 0.3,
      child: Drawer(
        child: SizedBox(
          height: AppDimensions.size!.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: Space.hf(1),
                    height: isCollapsed
                        ? AppDimensions.size!.height * 0.18
                        : AppDimensions.size!.height * 0.25,
                    width: double.infinity,
                    color: AppTheme.c!.primary,
                    child: buildHeader(isCollapsed),
                  ),
                  Space.yf(1),
                  SizedBox(
                    height: AppDimensions.size!.height * 0.4,
                    child: ListView(
                      padding: isCollapsed ? Space.z : Space.all(0.5),
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        ...NavBarUtils.names.asMap().entries.map(
                          (e) {
                            return buildMenuItem(
                              isCollapsed: isCollapsed,
                              text: e.value['label'],
                              icon: e.value['icon'],
                              isActive: currentRoute == e.value['path'],
                              path: e.value['path'],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Space.yf(0.5),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: buildCollapseIcon(context, isCollapsed),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required Icon icon,
    required String path,
    required bool isActive,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: isActive && isCollapsed
              ? BorderSide(
                  color: AppTheme.c!.primary!,
                  width: 3,
                )
              : const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
          left: isActive && !isCollapsed
              ? BorderSide(
                  color: AppTheme.c!.primary!,
                  width: 3,
                )
              : const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
        ),
      ),
      child: isCollapsed
          ? ListTile(
              title: icon,
              iconColor: isActive ? AppTheme.c!.primary : Colors.black,
              onTap: () => locator<AppNavigation>().navigateTo(path),
            )
          : ListTile(
              leading: icon,
              iconColor: isActive ? AppTheme.c!.primary : Colors.black,
              title: isActive
                  ? Text(
                      text,
                      style: TextStyle(
                        color: AppTheme.c!.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              onTap: () => locator<AppNavigation>().navigateTo(path),
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = AppDimensions.size!.width * 0.05;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.topRight;
    return Container(
      alignment: alignment,
      padding: Space.all(0.5, 0.5),
      height: AppDimensions.size!.height * 0.1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: SizedBox(
            height: size,
            child: Icon(icon, color: Colors.white),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);

            provider.toggleIsCollapsed();
          },
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? const SizedBox(
          height: 0,
        )
      : Image.asset(
          "assets/app_logo2.png",
        );
}
