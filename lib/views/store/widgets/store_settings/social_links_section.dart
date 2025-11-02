import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/core/widgets/dynamic_custom_text_field.dart';

class SocialLinksSection extends StatelessWidget {
  const SocialLinksSection({
    super.key,
    required this.whatsappController,
    required this.instagramController,
    required this.facebookController,
    required this.tiktokController,
    required this.selectedThemeColor,
  });

  final TextEditingController whatsappController;
  final TextEditingController instagramController;
  final TextEditingController facebookController;
  final TextEditingController tiktokController;
  final Color selectedThemeColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Social Media & Contact',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Add your social media links to connect with customers',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 16),
        _buildSocialField(
          controller: whatsappController,
          label: 'WhatsApp',
          hint: '+970 XX XXX XXXX',
          icon: Icons.phone_outlined,
          color: const Color(0xff25D366),
        ),
        const SizedBox(height: 16),
        _buildSocialField(
          controller: instagramController,
          label: 'Instagram',
          hint: '@yourusername',
          icon: Icons.camera_alt_outlined,
          color: const Color(0xffE4405F),
        ),
        const SizedBox(height: 16),
        _buildSocialField(
          controller: facebookController,
          label: 'Facebook',
          hint: 'facebook.com/yourpage',
          icon: Icons.facebook_outlined,
          color: const Color(0xff1877F2),
        ),
        const SizedBox(height: 16),
        _buildSocialField(
          controller: tiktokController,
          label: 'TikTok',
          hint: '@yourusername',
          icon: Icons.video_library_outlined,
          color: const Color(0xff000000),
        ),
      ],
    );
  }

  Widget _buildSocialField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 18,
                color: color,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '(Optional)',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        DynamicCustomTextField(
          hintText: hint,
          controller: controller,
          keyboardType: label == 'WhatsApp'
              ? TextInputType.phone
              : TextInputType.text,
          focusColor: selectedThemeColor,
          prefixIcon: Icon(
            icon,
            color: color.withOpacity(0.7),
            size: 20,
          ),
        ),
      ],
    );
  }
}
