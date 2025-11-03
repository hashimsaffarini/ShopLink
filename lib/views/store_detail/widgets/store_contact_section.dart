import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/models/store.dart';

class StoreContactSection extends StatelessWidget {
  final Store store;

  const StoreContactSection({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (store.whatsapp != null)
                  _buildContactButton(
                    'WhatsApp',
                    FontAwesomeIcons.whatsapp,
                    const Color(0xff25D366),
                    () {
                      // TODO: Open WhatsApp
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Opening WhatsApp: ${store.whatsapp}'),
                        ),
                      );
                    },
                  ),
                if (store.instagram != null)
                  _buildContactButton(
                    'Instagram',
                    FontAwesomeIcons.instagram,
                    const Color(0xffE4405F),
                    () {
                      // TODO: Open Instagram
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Opening Instagram: @${store.instagram}',
                          ),
                        ),
                      );
                    },
                  ),
                if (store.facebook != null)
                  _buildContactButton(
                    'Facebook',
                    FontAwesomeIcons.facebook,
                    const Color(0xff1877F2),
                    () {
                      // TODO: Open Facebook
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Opening Facebook: ${store.facebook}'),
                        ),
                      );
                    },
                  ),
                if (store.tiktok != null)
                  _buildContactButton(
                    'TikTok',
                    FontAwesomeIcons.tiktok,
                    const Color(0xff000000),
                    () {
                      // TODO: Open TikTok
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Opening TikTok: @${store.tiktok}'),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
