import 'package:flutter/material.dart';
import 'package:shop_link/models/product.dart';
import 'package:shop_link/views/product_detail/widgets/product_detail_body.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  const ProductDetailView({
    super.key,
    required this.product,
  });

  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailBody(product: product),
    );
  }
}
