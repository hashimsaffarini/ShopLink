import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/models/product.dart';

class ProductActionsSection extends StatefulWidget {
  final Product product;

  const ProductActionsSection({
    super.key,
    required this.product,
  });

  @override
  State<ProductActionsSection> createState() => _ProductActionsSectionState();
}

class _ProductActionsSectionState extends State<ProductActionsSection> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? 'Added ${widget.product.name} to favorites'
              : 'Removed ${widget.product.name} from favorites',
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Price Display
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Price',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.blackColor.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    '\$${widget.product.finalPrice.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Add to Favorite Button
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: _toggleFavorite,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFavorite
                      ? Colors.red
                      : AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 22,
                ),
                label: Text(
                  isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
