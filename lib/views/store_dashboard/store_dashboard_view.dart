import 'package:flutter/material.dart';
import 'package:shop_link/views/store_dashboard/widgets/store_dashboard_body.dart';

class StoreDashboardView extends StatelessWidget {
  const StoreDashboardView({super.key});

  static const String routeName = '/store-dashboard';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StoreDashboardBody(),
    );
  }
}
