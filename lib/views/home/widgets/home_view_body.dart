import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_link/core/utils/app_colors.dart';
import 'package:shop_link/models/store.dart';
import 'package:shop_link/views/home/widgets/search_bar_section.dart';
import 'package:shop_link/views/home/widgets/categories_section.dart';
import 'package:shop_link/views/home/widgets/featured_stores_section.dart';
import 'package:shop_link/views/home/widgets/all_stores_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String _selectedCategory = 'All';
  String _searchQuery = '';

  // Sample data - In real app, this would come from backend
  final List<Store> _stores = [
    Store(
      id: '1',
      name: 'Fashion Hub',
      description: 'Your one-stop shop for trendy clothes and accessories',
      category: 'Clothing',
      location: 'Ramallah',
      phoneNumber: '+970 599 123 456',
      themeColor: 0xff643DF8,
      viewsCount: 2500,
      productsCount: 45,
      rating: 4.8,
      isVerified: true,
      whatsapp: '+970599123456',
      instagram: '@fashionhub',
    ),
    Store(
      id: '2',
      name: 'Tech Store',
      description: 'Latest electronics and gadgets at best prices',
      category: 'Electronics',
      location: 'Nablus',
      phoneNumber: '+970 598 765 432',
      themeColor: 0xff10B981,
      viewsCount: 3200,
      productsCount: 78,
      rating: 4.9,
      isVerified: true,
      whatsapp: '+970598765432',
    ),
    Store(
      id: '3',
      name: 'Beauty Corner',
      description: 'Premium beauty and skincare products',
      category: 'Beauty Products',
      location: 'Hebron',
      phoneNumber: '+970 597 321 654',
      themeColor: 0xffE4405F,
      viewsCount: 1800,
      productsCount: 32,
      rating: 4.7,
      isVerified: false,
      instagram: '@beautycorner',
    ),
    Store(
      id: '4',
      name: 'Sports Pro',
      description: 'Everything you need for your active lifestyle',
      category: 'Sports',
      location: 'Gaza',
      phoneNumber: '+970 596 789 012',
      themeColor: 0xffF59E0B,
      viewsCount: 1500,
      productsCount: 56,
      rating: 4.6,
      isVerified: true,
    ),
  ];

  List<Store> get _filteredStores {
    return _stores.where((store) {
      final matchesCategory =
          _selectedCategory == 'All' || store.category == _selectedCategory;
      final matchesSearch =
          store.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          store.description.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // App Bar
        SliverAppBar(
          expandedHeight: 140,
          floating: false,
          pinned: true,
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              onPressed: () {
                // TODO: Navigate to favorite products
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Favorite Products'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.store_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // TODO: Navigate to favorite stores
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Favorite Stores'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                // Logout and navigate back to splash view
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/splash',
                  (route) => false,
                );
              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Discover Stores',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            centerTitle: false,
            titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
            background: Stack(
              children: [
                // Gradient Background
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryColor,
                        AppColors.primaryColor.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                // Decorative circles
                Positioned(
                  top: -40,
                  right: -40,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                // Subtitle only in background (will scroll away)
                Positioned(
                  bottom: 60,
                  left: 20,
                  right: 100,
                  child: Text(
                    'Find your favorite shops',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Content
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              SearchBarSection(
                onSearchChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),

              // Categories
              CategoriesSection(
                selectedCategory: _selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),

              // Featured Stores
              if (_selectedCategory == 'All' && _searchQuery.isEmpty)
                FeaturedStoresSection(
                  stores: _stores.where((s) => s.isVerified).take(3).toList(),
                ),

              // All Stores
              AllStoresSection(
                stores: _filteredStores,
                selectedCategory: _selectedCategory,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
