import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/models/product.dart';

class DeleteProductDialog extends StatelessWidget {
  final Product product;
  final VoidCallback onConfirm;

  const DeleteProductDialog({
    super.key,
    required this.product,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        'Delete Product',
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Text(
        'Are you sure you want to delete "${product.name}"? This action cannot be undone.',
        style: GoogleFonts.poppins(
          fontSize: 14,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          child: Text(
            'Delete',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
