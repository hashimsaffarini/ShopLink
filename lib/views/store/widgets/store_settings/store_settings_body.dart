import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/core/widgets/dynamic_custom_text_field.dart';
import 'package:shop_link/views/store/store_main.dart';
import 'package:shop_link/views/store/widgets/store_settings/location_section.dart';
import 'package:shop_link/views/store/widgets/store_settings/social_links_section.dart';
import 'package:shop_link/views/store/widgets/store_settings/store_description_field.dart';
import 'package:shop_link/views/store/widgets/store_settings/store_header_section.dart';
import 'package:shop_link/views/store/widgets/store_settings/store_image_section.dart';
import 'package:shop_link/views/store/widgets/store_settings/store_type_section.dart';
import 'package:shop_link/views/store/widgets/store_settings/theme_color_section.dart';

class StoreSettingsBody extends StatefulWidget {
  const StoreSettingsBody({super.key});

  @override
  State<StoreSettingsBody> createState() => _StoreSettingsBodyState();
}

class _StoreSettingsBodyState extends State<StoreSettingsBody> {
  final _formKey = GlobalKey<FormState>();
  final _storeNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _instagramController = TextEditingController();
  final _facebookController = TextEditingController();
  final _tiktokController = TextEditingController();

  Color _selectedThemeColor = AppColors.primaryColor;
  String? _selectedCity;
  String? _storeImagePath;
  String? _selectedStoreType;

  @override
  void dispose() {
    _storeNameController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _whatsappController.dispose();
    _instagramController.dispose();
    _facebookController.dispose();
    _tiktokController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const StoreHeaderSection(),
              const SizedBox(height: 40),
              StoreImageSection(
                storeImagePath: _storeImagePath,
                selectedThemeColor: _selectedThemeColor,
                onImagePicked: (path) {
                  setState(() {
                    _storeImagePath = path;
                  });
                },
              ),
              const SizedBox(height: 32),
              _buildStoreNameField(),
              const SizedBox(height: 20),
              StoreDescriptionField(
                controller: _descriptionController,
                selectedThemeColor: _selectedThemeColor,
              ),
              const SizedBox(height: 32),
              StoreTypeSection(
                selectedStoreType: _selectedStoreType,
                onTypeSelected: (type) {
                  setState(() {
                    _selectedStoreType = type;
                  });
                },
              ),
              const SizedBox(height: 32),
              ThemeColorSection(
                selectedThemeColor: _selectedThemeColor,
                onColorSelected: (color) {
                  setState(() {
                    _selectedThemeColor = color;
                  });
                },
              ),
              const SizedBox(height: 32),
              LocationSection(
                selectedCity: _selectedCity,
                onCityChanged: (city) {
                  setState(() {
                    _selectedCity = city;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildPhoneField(),
              const SizedBox(height: 32),
              SocialLinksSection(
                whatsappController: _whatsappController,
                instagramController: _instagramController,
                facebookController: _facebookController,
                tiktokController: _tiktokController,
                selectedThemeColor: _selectedThemeColor,
              ),
              const SizedBox(height: 40),
              _buildPreviewButton(),
              const SizedBox(height: 16),
              _buildSaveButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Store Name',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 12),
        DynamicCustomTextField(
          hintText: 'Enter your store name',
          controller: _storeNameController,
          keyboardType: TextInputType.text,
          focusColor: _selectedThemeColor,
          prefixIcon: Icon(
            Icons.storefront_outlined,
            color: AppColors.blackColor.withOpacity(0.5),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your store name';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Phone',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 12),
        DynamicCustomTextField(
          hintText: '+970 XX XXX XXXX',
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          focusColor: _selectedThemeColor,
          prefixIcon: Icon(
            Icons.phone_outlined,
            color: AppColors.blackColor.withOpacity(0.5),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPreviewButton() {
    return OutlinedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _showStorePreview();
        }
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 58),
        side: BorderSide(
          color: _selectedThemeColor,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.visibility_outlined,
            color: _selectedThemeColor,
          ),
          const SizedBox(width: 8),
          Text(
            'Preview Store',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: _selectedThemeColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _selectedThemeColor,
            _selectedThemeColor.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _selectedThemeColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _saveStoreSettings(context);
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 58),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Save & Launch Store',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showStorePreview() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Store Header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            _selectedThemeColor,
                            _selectedThemeColor.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            child: _storeImagePath != null
                                ? ClipOval(
                                    child: Image.file(
                                      File(_storeImagePath!),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(
                                    Icons.storefront_rounded,
                                    size: 50,
                                    color: _selectedThemeColor,
                                  ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _storeNameController.text.isEmpty
                                ? 'Your Store Name'
                                : _storeNameController.text,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.white.withOpacity(0.9),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _selectedCity ?? 'Palestine',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Store Type Badge
                    if (_selectedStoreType != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedThemeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedThemeColor.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _getStoreTypeIcon(_selectedStoreType!),
                              size: 18,
                              color: _selectedThemeColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _selectedStoreType!,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: _selectedThemeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (_selectedStoreType != null) const SizedBox(height: 16),
                    // Store Description
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About Us',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _descriptionController.text.isEmpty
                                ? 'Your store description will appear here...'
                                : _descriptionController.text,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: AppColors.blackColor.withOpacity(0.7),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Contact Info
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: _selectedThemeColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.phone,
                              color: _selectedThemeColor,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColors.blackColor.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                _phoneController.text.isEmpty
                                    ? '+970 XX XXX XXXX'
                                    : _phoneController.text,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Social Media Quick Actions
                    if (_whatsappController.text.isNotEmpty ||
                        _instagramController.text.isNotEmpty ||
                        _facebookController.text.isNotEmpty ||
                        _tiktokController.text.isNotEmpty)
                      const SizedBox(height: 16),
                    if (_whatsappController.text.isNotEmpty ||
                        _instagramController.text.isNotEmpty ||
                        _facebookController.text.isNotEmpty ||
                        _tiktokController.text.isNotEmpty)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Connect With Us',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                if (_whatsappController.text.isNotEmpty)
                                  _buildSocialButton(
                                    icon: Icons.phone_rounded,
                                    label: 'WhatsApp',
                                    color: const Color(0xff25D366),
                                  ),
                                if (_instagramController.text.isNotEmpty)
                                  _buildSocialButton(
                                    icon: Icons.camera_alt_rounded,
                                    label: 'Instagram',
                                    color: const Color(0xffE4405F),
                                  ),
                                if (_facebookController.text.isNotEmpty)
                                  _buildSocialButton(
                                    icon: Icons.facebook_rounded,
                                    label: 'Facebook',
                                    color: const Color(0xff1877F2),
                                  ),
                                if (_tiktokController.text.isNotEmpty)
                                  _buildSocialButton(
                                    icon: Icons.music_note_rounded,
                                    label: 'TikTok',
                                    color: Colors.black,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 54),
                  backgroundColor: _selectedThemeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Close Preview',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
            color: color,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getStoreTypeIcon(String type) {
    switch (type) {
      case 'Clothing':
        return Icons.checkroom_rounded;
      case 'Shoes':
        return Icons.shopping_bag_rounded;
      case 'Accessories':
        return Icons.watch_rounded;
      case 'Electronics':
        return Icons.devices_rounded;
      case 'Beauty Products':
        return Icons.face_rounded;
      case 'Home & Garden':
        return Icons.home_rounded;
      case 'Sports':
        return Icons.sports_soccer_rounded;
      case 'Books':
        return Icons.menu_book_rounded;
      case 'Toys':
        return Icons.toys_rounded;
      case 'Food & Beverages':
        return Icons.restaurant_rounded;
      case 'Jewelry':
        return Icons.diamond_rounded;
      case 'Other':
        return Icons.store_rounded;
      default:
        return Icons.store_rounded;
    }
  }

  void _saveStoreSettings(BuildContext context) {
    Navigator.pushNamed(context, StoreMain.routeName);
  }
}
