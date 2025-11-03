import 'package:flutter/material.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/models/product.dart';

class ProductImageSection extends StatelessWidget {
  final Product product;

  const ProductImageSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(0.05),
      ),
      child: Stack(
        children: [
          // Product Image Placeholder
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  size: 100,
                  color: AppColors.blackColor.withOpacity(0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.blackColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          // Discount Badge
          if ((product.discount ?? 0) > 0)
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '-${product.discount}%',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
