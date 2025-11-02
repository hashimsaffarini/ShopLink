import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/views/store_dashboard/widgets/share_button.dart';
import 'package:shop_link/views/store_dashboard/widgets/welcome_section.dart';
import 'package:shop_link/views/store_dashboard/widgets/statistics_section.dart';
import 'package:shop_link/views/store_dashboard/widgets/store_preview_section.dart';
import 'package:shop_link/views/store_dashboard/widgets/quick_actions_section.dart';

class StoreDashboardBody extends StatelessWidget {
  const StoreDashboardBody({super.key});

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
          actions: const [
            ShareButton(),
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
              const [
                WelcomeSection(),
                SizedBox(height: 24),
                StatisticsSection(),
                SizedBox(height: 32),
                StorePreviewSection(),
                SizedBox(height: 32),
                QuickActionsSection(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
