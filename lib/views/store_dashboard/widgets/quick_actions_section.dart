import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/views/add_product/add_product_view.dart';
import 'package:shop_link/views/store_dashboard/widgets/quick_action_button.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 16),
        QuickActionButton(
          icon: Icons.visibility_outlined,
          title: 'View Store as Visitor',
          subtitle: 'See how customers view your store',
          color: AppColors.primaryColor,
          onTap: () {
            // TODO: Navigate to public store view
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Opening store preview...',
                  style: GoogleFonts.poppins(),
                ),
                backgroundColor: AppColors.primaryColor,
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        QuickActionButton(
          icon: Icons.add_circle_outline,
          title: 'Add New Product',
          subtitle: 'List a new item in your store',
          color: const Color(0xff10B981),
          onTap: () {
            Navigator.pushNamed(context, AddProductView.routeName);
          },
        ),
        const SizedBox(height: 12),
        QuickActionButton(
          icon: Icons.settings_outlined,
          title: 'Edit Store Settings',
          subtitle: 'Update store info and preferences',
          color: const Color(0xffF59E0B),
          onTap: () {
            Navigator.pushNamed(context, '/store-settings');
          },
        ),
      ],
    );
  }
}
