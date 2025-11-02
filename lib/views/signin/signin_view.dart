import 'package:flutter/material.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = '/signin';

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
      ),
      body: const SigninViewBody(),
    );
  }
}
