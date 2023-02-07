import 'package:get_it/get_it.dart';
import 'package:poolart/services/app_navigation.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => AppNavigation());
}
