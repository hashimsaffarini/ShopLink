import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';

class SearchBarSection extends StatelessWidget {
  final ValueChanged<String> onSearchChanged;

  const SearchBarSection({
    super.key,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          onChanged: onSearchChanged,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: AppColors.blackColor,
          ),
          decoration: InputDecoration(
            hintText: 'Search for stores...',
            hintStyle: GoogleFonts.poppins(
              fontSize: 15,
              color: AppColors.blackColor.withOpacity(0.4),
            ),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.primaryColor,
              size: 24,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
        ),
      ),
    );
  }
}
