import 'package:flutter/material.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/services/app_navigation.dart';

class MobileDrawerItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final String path;
  final Icon icon;

  const MobileDrawerItem({
    Key? key,
    required this.label,
    required this.isActive,
    required this.path,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(right: AppDimensions.size!.width * 0.35),
        child: Container(
          padding: Space.all(0.2, 0.3),
          margin: Space.h1!,
          decoration: BoxDecoration(
            border: Border(
              left: isActive
                  ? BorderSide(
                      color: AppTheme.c!.primary!,
                      width: 3,
                    )
                  : const BorderSide(
                      color: Colors.transparent,
                    ),
            ),
          ),
          child: ListTile(
            leading: icon,
            iconColor: isActive ? AppTheme.c!.primary : Colors.black,
            title: isActive
                ? Text(
                    label,
                    style: TextStyle(
                      color: AppTheme.c!.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    label,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            onTap: () => locator<AppNavigation>().navigateTo(path),
          ),
        ),
      ),
    );
  }
}
