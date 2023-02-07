import 'package:easy_localization/easy_localization.dart';
import 'package:poolart/app_routes.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:flutter/material.dart';

class NavBarUtils {
  static List<Map<String, dynamic>> names = [
    {
      'label': LocaleKeys.home.tr(),
      'path': AppRoutes.home,
      'icon': const Icon(Icons.home),
    },
    {
      'label': LocaleKeys.aboutUs.tr(),
      'path': AppRoutes.aboutUs,
      'icon': const Icon(Icons.people),
    },
    {
      'label': LocaleKeys.projects.tr(),
      'path': AppRoutes.projects,
      'icon': const Icon(Icons.pages),
    },
    {
      'label': LocaleKeys.contactUs.tr(),
      'path': AppRoutes.contact,
      'icon': const Icon(Icons.phone),
    },
  ];
}
