import 'package:flutter/material.dart';
import 'package:shop_link/models/store.dart';
import 'package:shop_link/views/store_detail/widgets/store_detail_body.dart';

class StoreDetailView extends StatelessWidget {
  final Store store;

  const StoreDetailView({
    super.key,
    required this.store,
  });

  static const String routeName = '/store-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreDetailBody(store: store),
    );
  }
}
