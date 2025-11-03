import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/models/store.dart';
import 'package:shop_link/models/product.dart';
import 'package:shop_link/views/store_detail/widgets/product_grid_card.dart';

class StoreProductsSection extends StatelessWidget {
  final Store store;
  final List<Product> products;

  const StoreProductsSection({
    super.key,
    required this.store,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Products',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                '${products.length} items',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.blackColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (products.isEmpty)
            _buildEmptyState()
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductGridCard(product: products[index]);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 64,
              color: AppColors.blackColor.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'No Products Yet',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This store hasn\'t added any products',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.blackColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
