import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_link/controllers/theme_provider.dart';
import 'package:shop_link/core/utils/app_router.dart';
import 'package:shop_link/views/store/store_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ShopLink(),
    ),
  );
}

class ShopLink extends ConsumerWidget {
  const ShopLink({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColor = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: themeColor,
        ),
        scaffoldBackgroundColor: const Color(0xffF9F9F9),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: StoreView.routeName,
    );
  }
}
