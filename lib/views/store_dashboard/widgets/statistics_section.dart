import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/views/store_dashboard/widgets/statistics_card.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistics',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: StatisticsCard(
                icon: Icons.inventory_2_rounded,
                title: 'Products',
                value: '24',
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: StatisticsCard(
                icon: Icons.visibility_rounded,
                title: 'Views',
                value: '1.2K',
                color: Color(0xff10B981),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
