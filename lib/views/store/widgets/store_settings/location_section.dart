import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({
    super.key,
    required this.selectedCity,
    required this.onCityChanged,
  });

  final String? selectedCity;
  final Function(String?) onCityChanged;

  static final List<String> palestineCities = [
    'Jerusalem',
    'Ramallah',
    'Hebron',
    'Nablus',
    'Gaza',
    'Bethlehem',
    'Jenin',
    'Tulkarm',
    'Qalqilya',
    'Jericho',
    'Rafah',
    'Khan Yunis',
    'Salfit',
    'Tubas',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location in Palestine',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1.5,
            ),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedCity,
            hint: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.blackColor.withOpacity(0.5),
                ),
                const SizedBox(width: 12),
                Text(
                  'Select your city',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor.withOpacity(0.4),
                  ),
                ),
              ],
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.blackColor.withOpacity(0.5),
              ),
            ),
            dropdownColor: Colors.white,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
            items: palestineCities.map((city) {
              return DropdownMenuItem(
                value: city,
                child: Text(city),
              );
            }).toList(),
            onChanged: onCityChanged,
            validator: (value) {
              if (value == null) {
                return 'Please select a city';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
