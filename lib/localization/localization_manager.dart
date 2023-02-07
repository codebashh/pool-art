import 'package:flutter/material.dart';
import 'package:poolart/localization/interface_localization_manager.dart';

enum LocalizationEnum {
  english,
  french,
}

extension LocalizationExtension on LocalizationEnum {
  Locale? get translate {
    switch (this) {
      case LocalizationEnum.english:
        return LocalizationManager.instance.enUSLocale;
      case LocalizationEnum.french:
        return LocalizationManager.instance.frFRLocale;
      default:
        return LocalizationManager.instance.enUSLocale;
    }
  }
}

class LocalizationManager implements InterfaceLocalizationManager {
  static LocalizationManager? _instance;
  static LocalizationManager get instance {
    _instance ??= LocalizationManager._init();
    return _instance!;
  }

  LocalizationManager._init();

  @override
  String? localePath = 'assets/translations/';

  final enUSLocale = const Locale('en');
  final frFRLocale = const Locale('fr');

  @override
  List<Locale> get supportedLocales => [enUSLocale, frFRLocale];

  @override
  LocalizationEnum currentLocale = LocalizationEnum.english;
}
