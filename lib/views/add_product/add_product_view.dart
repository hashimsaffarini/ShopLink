import 'package:flutter/material.dart';
import 'package:shop_link/views/add_product/widgets/add_product_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const String routeName = '/add-product';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddProductBody(),
    );
  }
}
