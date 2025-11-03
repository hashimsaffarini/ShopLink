import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/models/store.dart';
import 'package:shop_link/views/home/widgets/featured_store_card.dart';

class FeaturedStoresSection extends StatelessWidget {
  final List<Store> stores;

  const FeaturedStoresSection({
    super.key,
    required this.stores,
  });

  @override
  Widget build(BuildContext context) {
    if (stores.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: AppColors.primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Featured Stores',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: stores.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return FeaturedStoreCard(store: stores[index]);
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
