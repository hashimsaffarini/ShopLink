import 'package:flutter/material.dart';
import 'package:shop_link/models/store.dart';
import 'package:shop_link/models/product.dart';
import 'package:shop_link/views/store_detail/widgets/store_header_section.dart';
import 'package:shop_link/views/store_detail/widgets/store_info_section.dart';
import 'package:shop_link/views/store_detail/widgets/store_contact_section.dart';
import 'package:shop_link/views/store_detail/widgets/store_products_section.dart';

class StoreDetailBody extends StatelessWidget {
  final Store store;

  const StoreDetailBody({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    // Sample products for this store - In real app, fetch from backend
    final products = [
      Product(
        id: '1',
        name: 'Premium Sneakers',
        description:
            'High-quality running shoes with excellent comfort and durability',
        price: 299.99,
        discount: 15,
        createdAt: DateTime.now(),
      ),
      Product(
        id: '2',
        name: 'Casual T-Shirt',
        description: '100% cotton comfortable t-shirt for everyday wear',
        price: 49.99,
        createdAt: DateTime.now(),
      ),
      Product(
        id: '3',
        name: 'Sport Jacket',
        description:
            'Windproof and waterproof jacket perfect for outdoor activities',
        price: 129.99,
        discount: 20,
        createdAt: DateTime.now(),
      ),
      Product(
        id: '4',
        name: 'Running Shorts',
        description:
            'Lightweight and breathable shorts for maximum performance',
        price: 39.99,
        createdAt: DateTime.now(),
      ),
    ];

    return CustomScrollView(
      slivers: [
        // Store Header with gradient
        StoreHeaderSection(store: store),

        // Content
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Store Info
              StoreInfoSection(store: store),

              const SizedBox(height: 20),

              // Contact Section
              StoreContactSection(store: store),

              const SizedBox(height: 24),

              // Products Section
              StoreProductsSection(
                store: store,
                products: products,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
