import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';

class ThemeColorSection extends StatelessWidget {
  const ThemeColorSection({
    super.key,
    required this.selectedThemeColor,
    required this.onColorSelected,
  });

  final Color selectedThemeColor;
  final Function(Color) onColorSelected;

  static final List<Color> themeColors = [
    const Color(0xff643DF8), // Purple
    const Color(0xffFF6B6B), // Red
    const Color(0xff4ECDC4), // Teal
    const Color(0xffFFBE0B), // Yellow
    const Color(0xff06D6A0), // Green
    const Color(0xffF72585), // Pink
    const Color(0xff3A86FF), // Blue
    const Color(0xffFF6B35), // Orange
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Theme Color',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: themeColors.map((color) {
            final isSelected = selectedThemeColor == color;
            return GestureDetector(
              onTap: () => onColorSelected(color),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.blackColor
                        : Colors.transparent,
                    width: 3,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: color.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 28,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
