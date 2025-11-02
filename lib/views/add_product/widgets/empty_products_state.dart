import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';

class EmptyProductsState extends StatelessWidget {
  const EmptyProductsState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 80,
            color: AppColors.blackColor.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No products yet',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first product to get started',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.blackColor.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
