import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/views/add_product/add_product_view.dart';
import 'package:shop_link/views/store_dashboard/widgets/statistics_card.dart';
import 'package:shop_link/views/store_dashboard/widgets/store_preview_card.dart';
import 'package:shop_link/views/store_dashboard/widgets/quick_action_button.dart';

class StoreDashboardBody extends StatelessWidget {
  const StoreDashboardBody({super.key});

  void _shareStore(BuildContext context) {
    // TODO: Implement share functionality with actual store link
    const storeLink = 'https://shoplink.ps/store/your-store-name';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.share_rounded,
                size: 40,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Share Your Store',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Share your store link with customers',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.blackColor.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      storeLink,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      // TODO: Copy to clipboard
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Link copied to clipboard!',
                            style: GoogleFonts.poppins(),
                          ),
                          backgroundColor: const Color(0xff10B981),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.copy_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Open native share dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Opening share options...',
                      style: GoogleFonts.poppins(),
                    ),
                    backgroundColor: AppColors.primaryColor,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 54),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.ios_share_rounded, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    'Share via...',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 120,
          floating: false,
          pinned: true,
          backgroundColor: AppColors.primaryColor,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: Material(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: () => _shareStore(context),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.share_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Share',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Store Dashboard',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            centerTitle: false,
            titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
          ),
        ),

        // Content
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                // Welcome Section
                Text(
                  'Welcome back! 👋',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Manage your store and track your performance',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.blackColor.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 24),

                // Statistics Section
                Text(
                  'Statistics',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 16),

                // Stats Grid
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
                const SizedBox(height: 32),

                // Store Preview Section
                Text(
                  'Store Preview',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 16),
                const StorePreviewCard(),
                const SizedBox(height: 32),

                // Quick Actions Section
                Text(
                  'Quick Actions',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 16),

                // Action Buttons
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
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
