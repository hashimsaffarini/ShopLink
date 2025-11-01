import 'package:flutter/material.dart';
import 'package:shop_link/core/utils/app_colors.dart';

import 'views/splash/splash_view.dart';

void main() {
  runApp(const ShopLink());
}

class ShopLink extends StatelessWidget {
  const ShopLink({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: const Color(0xffF9F9F9),
      ),
      home: const SplashView(),
    );
  }
}
