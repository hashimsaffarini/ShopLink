import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/core/widgets/custom_button.dart';
import 'package:shop_link/core/widgets/dynamic_custom_text_field.dart';
import 'package:shop_link/models/product.dart';
import 'package:shop_link/views/add_product/widgets/product_image_picker.dart';
import 'package:shop_link/views/add_product/widgets/product_list_section.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();

  String? _productImagePath;
  late TabController _tabController;

  // Sample products list (in real app, this would come from a state management solution)
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Premium Sneakers',
      description: 'High-quality running shoes with excellent comfort',
      price: 299.99,
      discount: 15,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Product(
      id: '2',
      name: 'Casual T-Shirt',
      description: '100% cotton comfortable t-shirt',
      price: 49.99,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _discountController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _productImagePath = image.path;
        });
        navigator.pop();
      }
    } catch (e) {
      navigator.pop();
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            'Failed to pick image: $e',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showImageSourceModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose Image Source',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _pickImage(ImageSource.camera),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.camera_alt_rounded,
                            size: 40,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Camera',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () => _pickImage(ImageSource.gallery),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.photo_library_rounded,
                            size: 40,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Gallery',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _publishProduct() {
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill in all required fields',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final product = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text,
      description: _descriptionController.text,
      price: double.parse(_priceController.text),
      discount: _discountController.text.isEmpty
          ? null
          : double.parse(_discountController.text),
      imagePath: _productImagePath,
      createdAt: DateTime.now(),
    );

    // TODO: Save product to backend
    setState(() {
      _products.insert(0, product);
    });

    // Clear form
    _nameController.clear();
    _descriptionController.clear();
    _priceController.clear();
    _discountController.clear();
    setState(() {
      _productImagePath = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Product published successfully!',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: const Color(0xff10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );

    // Switch to products list tab
    _tabController.animateTo(1);
  }

  void _deleteProduct(Product product) {
    setState(() {
      _products.removeWhere((p) => p.id == product.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Product deleted',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _editProduct(Product product) {
    // TODO: Navigate to edit page or show edit dialog
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Edit ${product.name}',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: AppColors.blackColor,
                ),
                const SizedBox(width: 12),
                Text(
                  'Product Management',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),

          // Tab Bar
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.blackColor.withOpacity(0.5),
              indicatorColor: AppColors.primaryColor,
              labelStyle: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Add Product'),
                Tab(text: 'My Products'),
              ],
            ),
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Add Product Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Details',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Product Image Picker
                      ProductImagePicker(
                        imagePath: _productImagePath,
                        onPickImage: _showImageSourceModal,
                      ),
                      const SizedBox(height: 24),

                      // Product Name
                      Text(
                        'Product Name *',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DynamicCustomTextField(
                        controller: _nameController,
                        hintText: 'e.g., Premium Sneakers',
                        focusColor: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 20),

                      // Product Description
                      Text(
                        'Description *',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DynamicCustomTextField(
                        controller: _descriptionController,
                        hintText: 'Describe your product...',
                        maxLines: 4,
                        focusColor: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 20),

                      // Price and Discount Row
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price (ILS) *',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                DynamicCustomTextField(
                                  controller: _priceController,
                                  hintText: '0.00',
                                  keyboardType: TextInputType.number,
                                  focusColor: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discount (%)',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                DynamicCustomTextField(
                                  controller: _discountController,
                                  hintText: '0',
                                  keyboardType: TextInputType.number,
                                  focusColor: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Publish Button
                      CustomButton(
                        title: 'Publish Product',
                        onPressed: _publishProduct,
                      ),
                    ],
                  ),
                ),

                // My Products Tab
                ProductListSection(
                  products: _products,
                  onEdit: _editProduct,
                  onDelete: _deleteProduct,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
