import 'package:flutter/material.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'widgets/store_settings/store_settings_body.dart';

class StoreSettings extends StatelessWidget {
  const StoreSettings({super.key});
  static const String routeName = '/store_settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Store Setup',
          style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: const StoreSettingsBody(),
    );
  }
}
