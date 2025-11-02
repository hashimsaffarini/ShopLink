import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/core/widgets/custom_button.dart';
import 'package:shop_link/views/home/home_view.dart';
import 'package:shop_link/views/signup/signup_view.dart';

class ChooseRoleView extends StatefulWidget {
  const ChooseRoleView({super.key});

  @override
  State<ChooseRoleView> createState() => _ChooseRoleViewState();
}

class _ChooseRoleViewState extends State<ChooseRoleView> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              _buildHeader(),
              const SizedBox(height: 50),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildRoleCard(
                      role: 'user',
                      icon: Icons.person_outline_rounded,
                      title: 'User',
                      description: 'Browse and shop from amazing stores',
                      gradient: const LinearGradient(
                        colors: [Color(0xFF643DF8), Color(0xFF8B6EF9)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildRoleCard(
                      role: 'store',
                      icon: Icons.storefront_outlined,
                      title: 'Store Owner',
                      description: 'Manage your store and reach customers',
                      gradient: const LinearGradient(
                        colors: [Color(0xFF202020), Color(0xFF404040)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildContinueButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Choose Your Role',
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Select how you want to use ShopLink',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildRoleCard({
    required String role,
    required IconData icon,
    required String title,
    required String description,
    required Gradient gradient,
  }) {
    final isSelected = selectedRole == role;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade200,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              // Animated Gradient Background
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                opacity: isSelected ? 1.0 : 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: gradient,
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    // Icon Section
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white.withValues(alpha: 0.2)
                            : AppColors.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        icon,
                        size: 36,
                        color: isSelected
                            ? Colors.white
                            : AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Text Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.blackColor,
                            ),
                            child: Text(title),
                          ),
                          const SizedBox(height: 8),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: isSelected
                                  ? Colors.white.withValues(alpha: 0.9)
                                  : AppColors.blackColor.withValues(alpha: 0.6),
                              height: 1.4,
                            ),
                            child: Text(description),
                          ),
                        ],
                      ),
                    ),
                    // Check Icon with Animation
                    AnimatedScale(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.elasticOut,
                      scale: isSelected ? 1.0 : 0.0,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: selectedRole != null ? 1.0 : 0.5,
      child: CustomButton(
        title: 'Continue',
        onPressed: selectedRole != null
            ? () {
                if (selectedRole == 'user') {
                  Navigator.pushReplacementNamed(context, HomeView.routeName);
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SignupView.routeName,
                    (route) => false,
                  );
                }
              }
            : null,
      ),
    );
  }
}
