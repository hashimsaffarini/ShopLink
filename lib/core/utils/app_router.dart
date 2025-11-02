import 'package:flutter/material.dart';
import 'package:shop_link/views/add_product/add_product_view.dart';
import 'package:shop_link/views/home/home_view.dart';
import 'package:shop_link/views/signin/signin_view.dart';
import 'package:shop_link/views/signup/signup_view.dart';
import 'package:shop_link/views/splash/choose_role.dart';
import 'package:shop_link/views/splash/splash_view.dart';
import 'package:shop_link/views/store/store_main.dart';
import 'package:shop_link/views/store/store_settings.dart';
import 'package:shop_link/views/store_dashboard/store_dashboard_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StoreDashboardView.routeName:
        return MaterialPageRoute(
          builder: (_) => const StoreDashboardView(),
        );
      case AddProductView.routeName:
        return MaterialPageRoute(
          builder: (_) => const AddProductView(),
        );
      case StoreMain.routeName:
        return MaterialPageRoute(
          builder: (_) => const StoreMain(),
        );
      case StoreSettings.routeName:
        return MaterialPageRoute(
          builder: (_) => const StoreSettings(),
        );
      case SigninView.routeName:
        return MaterialPageRoute(
          builder: (_) => const SigninView(),
        );
      case SignupView.routeName:
        return MaterialPageRoute(
          builder: (_) => const SignupView(),
        );
      case HomeView.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
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
