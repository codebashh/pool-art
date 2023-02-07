import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poolart/base_wrapper.dart';
import 'package:poolart/cubits/products/cubit.dart';
import 'package:poolart/cubits/projects/cubit.dart';
import 'package:poolart/localization/codegen_loader.g.dart';
import 'package:poolart/localization/localization_manager.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/providers/app_provider.dart';
import 'package:poolart/providers/quote_provider.dart';
import 'package:poolart/providers/scroll_provider.dart';
import 'package:poolart/services/app_navigation.dart';
import 'package:poolart/providers/provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:poolart/app_routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'configs/core_theme.dart' as theme;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setUpLocator();
  setPathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      path: LocalizationManager.instance.localePath!,
      supportedLocales: LocalizationManager.instance.supportedLocales,
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: ((context) => ProjectsCubit())),
        BlocProvider(create: ((context) => ProductsCubit())),
        ChangeNotifierProvider(create: ((context) => AppProvider())),
        ChangeNotifierProvider(create: ((context) => QuoteProvider())),
        ChangeNotifierProvider(create: ((context) => ScrollProvider())),
        ChangeNotifierProvider(create: (create) => NavigationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Pool Art',
        theme: theme.themeLight,
        builder: (context, child) => BaseWrapper(child: child!),
        navigatorKey: locator<AppNavigation>().navigatorKey,
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppNavigation.onGenerateRoute,
      ),
    );
  }
}
