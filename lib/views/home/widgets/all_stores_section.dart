import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/models/store.dart';
import 'package:shop_link/views/home/widgets/store_card.dart';

class AllStoresSection extends StatelessWidget {
  final List<Store> stores;
  final String selectedCategory;

  const AllStoresSection({
    super.key,
    required this.stores,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            selectedCategory == 'All'
                ? 'All Stores'
                : '$selectedCategory Stores',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (stores.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.store_outlined,
                    size: 60,
                    color: AppColors.blackColor.withOpacity(0.3),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No stores found',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Try adjusting your search or filters',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.blackColor.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: stores.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return StoreCard(store: stores[index]);
            },
          ),
        const SizedBox(height: 24),
      ],
    );
  }
}
