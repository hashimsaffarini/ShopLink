import 'package:flutter/material.dart';
import 'package:shop_link/views/splash/widgets/choose_role_view.dart'
    show ChooseRoleView;

class ChooseRole extends StatelessWidget {
  const ChooseRole({super.key});
  static const String routeName = '/choose-role';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChooseRoleView(),
    );
  }
}
