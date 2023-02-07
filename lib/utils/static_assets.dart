import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:poolart/models/step_model.dart';

class StaticUtils {
  static const String appLogo1 = "assets/app_logo_1.png";
  static const String appLogo2 = "assets/app_logo_2.png";
  static const String homeImage = 'assets/home.png';
  static const String aboutUsImage = 'assets/about_us.png';
  static const String servicesImage = 'assets/services.png';
  static const String appLogo = 'assets/app_logo2.png';

  //section header names
  static const String project1 = 'PROJECT 1';
  static const String aboutUs = 'ABOUT US';
  static const String services = 'SERVICES';
  static String work = LocaleKeys.work.tr();
  static const String product = 'PRODUCTS';

  static String aboutUsTitle = LocaleKeys.aboutUsTitle.tr();
  static String servicesTitle = LocaleKeys.servicesTitle.tr();

  static List<String> featuresList = [
    LocaleKeys.construction.tr(),
    LocaleKeys.renovation.tr(),
    LocaleKeys.interview.tr(),
    LocaleKeys.equipment.tr(),
  ];

  // firebase images

  static const String aboutUsNetworkImg =
      'https://firebasestorage.googleapis.com/v0/b/pool-art-project.appspot.com/o/utils%2Fabout_us.png?alt=media&token=9d24809b-38f6-485d-8367-a461e33d3af7';
  static const String servicesNetworkImg =
      'https://firebasestorage.googleapis.com/v0/b/pool-art-project.appspot.com/o/utils%2Fservices.png?alt=media&token=c6c3f708-3c6c-46a4-b1d8-fe829c996c0e';

  // pool shapes
  static List<Map<String, dynamic>> poolShapes = [
    {
      'name': LocaleKeys.rectangle.tr(),
      'image': 'assets/pool_shapes/rectangle.png',
    },
    {
      'name': LocaleKeys.square.tr(),
      'image': 'assets/pool_shapes/square.png',
    },
    {
      'name': LocaleKeys.beach.tr(),
      'image': 'assets/pool_shapes/beach.png',
    },
    {
      'name': LocaleKeys.bean.tr(),
      'image': 'assets/pool_shapes/bean.png',
    },
    {
      'name': LocaleKeys.oval.tr(),
      'image': 'assets/pool_shapes/oval.png',
    },
    {
      'name': LocaleKeys.lShape.tr(),
      'image': 'assets/pool_shapes/l-shaped.png',
    },
  ];

  static List<Map<String, dynamic>> contactInfo = [
    {
      'icon': Icons.email,
      'title': LocaleKeys.email.tr(),
      'info': 'support@poolart.com',
    },
    {
      'icon': Icons.phone,
      'title': LocaleKeys.phone.tr(),
      'info': '+92 123 4567890',
    },
    {
      'icon': Icons.pin_drop,
      'title': LocaleKeys.location.tr(),
      'info': 'City, Country',
    },
  ];

  // pool depths
  static List<Map<String, dynamic>> poolDepths = [
    {
      'name': '${LocaleKeys.flatBottom.tr()} 1.30m',
      'image': 'assets/pool_depths/flat-1.png',
      'features': [4, 3, 5],
    },
    {
      'name': '${LocaleKeys.flatBottom.tr()} 1.50m',
      'image': 'assets/pool_depths/flat-2.png',
      'features': [4, 3, 5],
    },
    {
      'name':
          '${LocaleKeys.double.tr()} ${LocaleKeys.flatBottom.tr()} 1.06m x 1.5m',
      'image': 'assets/pool_depths/flat-double.png',
      'features': [4, 3, 5],
    },
  ];

  // pool colors
  static List<Map<String, dynamic>> poolColors = [
    {
      'name': LocaleKeys.whiteLiner.tr(),
      'image': 'assets/pool_colors/white-liner.png',
      'argb': const Color.fromARGB(255, 255, 255, 255),
    },
    {
      'name': LocaleKeys.skyBlueLiner.tr(),
      'image': 'assets/pool_colors/sky-blue-liner.png',
      'argb': const Color.fromARGB(255, 112, 240, 243),
    },
    {
      'name': LocaleKeys.sandLiner.tr(),
      'image': 'assets/pool_colors/sand-liner.png',
      'argb': const Color.fromARGB(255, 199, 206, 180),
    },
    {
      'name': LocaleKeys.frenchBlueLiner.tr(),
      'image': 'assets/pool_colors/french-blue-liner.png',
      'argb': const Color.fromARGB(255, 31, 184, 218),
    },
    {
      'name': LocaleKeys.greenLiner.tr(),
      'image': 'assets/pool_colors/green-liner.png',
      'argb': const Color.fromARGB(255, 71, 186, 193),
    },
    {
      'name': LocaleKeys.greyLiner.tr(),
      'image': 'assets/pool_colors/grey-liner.png',
      'argb': const Color.fromARGB(255, 220, 220, 220),
    },
  ];

  static List<StepModel> steps = [
    StepModel(
      icon: CommunityMaterialIcons.pool,
      text: LocaleKeys.shape.tr(),
      isDone: false,
      isActive: false,
    ),
    StepModel(
      icon: Icons.pinch,
      text: LocaleKeys.size.tr(),
      isDone: false,
      isActive: false,
    ),
    StepModel(
      icon: Icons.expand,
      text: LocaleKeys.depth.tr(),
      isDone: false,
      isActive: false,
    ),
    StepModel(
      icon: CommunityMaterialIcons.format_color_fill,
      text: LocaleKeys.color.tr(),
      isDone: false,
      isActive: false,
    ),
    StepModel(
      icon: Icons.person,
      text: LocaleKeys.personalInfo.tr(),
      isDone: false,
      isActive: false,
    ),
  ];
}
