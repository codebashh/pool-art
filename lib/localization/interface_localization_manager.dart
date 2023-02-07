import 'package:flutter/material.dart';
import 'package:poolart/localization/localization_manager.dart';

abstract class InterfaceLocalizationManager {
  String? localePath;
  List<Locale>? get supportedLocales;
  LocalizationEnum currentLocale = LocalizationEnum.english;
}
