import 'package:flutter/material.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/models/product.dart';
import 'package:shop_link/views/product_detail/widgets/product_image_section.dart';
import 'package:shop_link/views/product_detail/widgets/product_info_section.dart';
import 'package:shop_link/views/product_detail/widgets/product_actions_section.dart';

class ProductDetailBody extends StatelessWidget {
  final Product product;

  const ProductDetailBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.blackColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.share_outlined,
                  color: AppColors.blackColor,
                ),
                onPressed: () {
                  // TODO: Share product
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sharing product...'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ),
          // Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ProductImageSection(product: product),

                const SizedBox(height: 20),

                // Product Info
                ProductInfoSection(product: product),

                const SizedBox(height: 80), // Space for bottom bar
              ],
            ),
          ),
        ],
      ),
      // Bottom Actions
      bottomNavigationBar: ProductActionsSection(product: product),
    );
  }
}
