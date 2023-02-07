import 'package:flutter/material.dart';
import 'package:poolart/app_routes.dart';
import 'package:poolart/screens/about_us/about_us.dart';
import 'package:poolart/screens/contact/contact.dart';
import 'package:poolart/screens/get_a_quote/get_a_quote.dart';
import 'package:poolart/screens/home/home.dart';
import 'package:poolart/screens/product_details/product_details.dart';
import 'package:poolart/screens/project_details/project_details.dart';
import 'package:poolart/screens/projects/projects.dart';

class AppNavigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _FadeRoute(child: const HomeScreen(), route: AppRoutes.home);
      case AppRoutes.aboutUs:
        return _FadeRoute(
            child: const AboutUsScreen(), route: AppRoutes.aboutUs);
      case AppRoutes.projects:
        return _FadeRoute(
            child: const ProjectsScreen(), route: AppRoutes.projects);
      case AppRoutes.contact:
        return _FadeRoute(
            child: const ContactScreen(), route: AppRoutes.contact);
      case AppRoutes.projectDetails:
        return _FadeRoute(
            child: const ProjectDetailsScreen(),
            route: AppRoutes.projectDetails);
      case AppRoutes.getAQuote:
        return _FadeRoute(
            child: const GetAQuoteScreen(), route: AppRoutes.getAQuote);
      case AppRoutes.productDetailScreen:
        return _FadeRoute(
            child: const ProductDetailScreen(),
            route: AppRoutes.productDetailScreen);
      default:
        return _FadeRoute(child: const HomeScreen(), route: AppRoutes.home);
    }
  }

  Future<dynamic> navigateTo(String route) {
    return navigatorKey.currentState!.pushNamed(route);
  }

  void goBack() => navigatorKey.currentState!.pop();
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String route;

  _FadeRoute({required this.child, required this.route})
      : super(
          settings: RouteSettings(name: route),
          pageBuilder: (context, ani1, ani2) => child,
          transitionsBuilder: (context, ani1, ani2, child) => FadeTransition(
            opacity: ani1,
            child: child,
          ),
        );
}
