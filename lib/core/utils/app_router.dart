import 'package:flutter/material.dart';
import 'package:shop_link/views/splash/choose_role.dart';
import 'package:shop_link/views/splash/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case ChooseRole.routeName:
        return MaterialPageRoute(
          builder: (_) => const ChooseRole(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
