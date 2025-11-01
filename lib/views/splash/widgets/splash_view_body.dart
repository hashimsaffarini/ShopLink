import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/core/widgets/custom_button.dart';
import 'package:shop_link/views/splash/choose_role.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _slideController,
            curve: Curves.easeOutBack,
          ),
        );

    return FadeTransition(
      opacity: _fadeController,
      child: SlideTransition(
        position: slideAnimation,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                AnimatedScale(
                  scale: _fadeController.value == 0 ? 0.8 : 1.0,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutBack,
                  child: Image.asset(
                    'assets/images/splash.png',
                    height: 134,
                    width: 134,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'ShopLink',
                  style: GoogleFonts.poppins(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Create your own store, share your link, and connect with customers instantly.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 169, 162, 162),
                  ),
                ),
                const Spacer(),
                ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _fadeController,
                    curve: Curves.easeOutBack,
                  ),
                  child: CustomButton(
                    title: 'Let\'s get started',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        ChooseRole.routeName,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
