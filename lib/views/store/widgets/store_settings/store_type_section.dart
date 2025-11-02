import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';

class StoreTypeSection extends StatelessWidget {
  const StoreTypeSection({
    super.key,
    required this.selectedStoreType,
    required this.onTypeSelected,
  });

  final String? selectedStoreType;
  final Function(String) onTypeSelected;

  static final List<Map<String, dynamic>> storeTypes = [
    {'name': 'Clothing', 'icon': Icons.checkroom_outlined},
    {'name': 'Shoes', 'icon': Icons.shopping_bag_outlined},
    {'name': 'Accessories', 'icon': Icons.watch_outlined},
    {'name': 'Electronics', 'icon': Icons.devices_outlined},
    {'name': 'Beauty Products', 'icon': Icons.face_outlined},
    {'name': 'Home & Garden', 'icon': Icons.home_outlined},
    {'name': 'Sports', 'icon': Icons.sports_soccer_outlined},
    {'name': 'Books', 'icon': Icons.menu_book_outlined},
    {'name': 'Toys', 'icon': Icons.toys_outlined},
    {'name': 'Food & Beverages', 'icon': Icons.restaurant_outlined},
    {'name': 'Jewelry', 'icon': Icons.diamond_outlined},
    {'name': 'Other', 'icon': Icons.store_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Store Type',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Select the category that best describes your store',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.0,
          ),
          itemCount: storeTypes.length,
          itemBuilder: (context, index) {
            final type = storeTypes[index];
            final isSelected = selectedStoreType == type['name'];

            return GestureDetector(
              onTap: () => onTypeSelected(type['name'] as String),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryColor
                      : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryColor
                        : Colors.grey.shade200,
                    width: isSelected ? 2 : 1.5,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      type['icon'] as IconData,
                      size: 32,
                      color: isSelected ? Colors.white : AppColors.primaryColor,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      type['name'] as String,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: isSelected ? Colors.white : AppColors.blackColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
