import 'package:flutter/material.dart';
import 'package:shop_link/models/product.dart';
import 'package:shop_link/views/add_product/widgets/empty_products_state.dart';
import 'package:shop_link/views/add_product/widgets/product_card.dart';
import 'package:shop_link/views/add_product/widgets/delete_product_dialog.dart';

class ProductListSection extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onEdit;
  final Function(Product) onDelete;

  const ProductListSection({
    super.key,
    required this.products,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const EmptyProductsState();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          onEdit: () => onEdit(product),
          onDelete: () {
            showDialog(
              context: context,
              builder: (context) => DeleteProductDialog(
                product: product,
                onConfirm: () => onDelete(product),
              ),
            );
          },
        );
      },
    );
  }
}
