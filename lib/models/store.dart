class Store {
  final String id;
  final String name;
  final String description;
  final String? logoUrl;
  final String category;
  final String location;
  final String phoneNumber;
  final String? whatsapp;
  final String? instagram;
  final String? facebook;
  final String? tiktok;
  final int themeColor;
  final int viewsCount;
  final int productsCount;
  final double rating;
  final bool isVerified;

  Store({
    required this.id,
    required this.name,
    required this.description,
    this.logoUrl,
    required this.category,
    required this.location,
    required this.phoneNumber,
    this.whatsapp,
    this.instagram,
    this.facebook,
    this.tiktok,
    required this.themeColor,
    this.viewsCount = 0,
    this.productsCount = 0,
    this.rating = 0.0,
    this.isVerified = false,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logoUrl': logoUrl,
      'category': category,
      'location': location,
      'phoneNumber': phoneNumber,
      'whatsapp': whatsapp,
      'instagram': instagram,
      'facebook': facebook,
      'tiktok': tiktok,
      'themeColor': themeColor,
      'viewsCount': viewsCount,
      'productsCount': productsCount,
      'rating': rating,
      'isVerified': isVerified,
    };
  }

  // Create from JSON
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      logoUrl: json['logoUrl'] as String?,
      category: json['category'] as String,
      location: json['location'] as String,
      phoneNumber: json['phoneNumber'] as String,
      whatsapp: json['whatsapp'] as String?,
      instagram: json['instagram'] as String?,
      facebook: json['facebook'] as String?,
      tiktok: json['tiktok'] as String?,
      themeColor: json['themeColor'] as int,
      viewsCount: json['viewsCount'] as int? ?? 0,
      productsCount: json['productsCount'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      isVerified: json['isVerified'] as bool? ?? false,
    );
  }

  // Copy with method
  Store copyWith({
    String? id,
    String? name,
    String? description,
    String? logoUrl,
    String? category,
    String? location,
    String? phoneNumber,
    String? whatsapp,
    String? instagram,
    String? facebook,
    String? tiktok,
    int? themeColor,
    int? viewsCount,
    int? productsCount,
    double? rating,
    bool? isVerified,
  }) {
    return Store(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logoUrl: logoUrl ?? this.logoUrl,
      category: category ?? this.category,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      whatsapp: whatsapp ?? this.whatsapp,
      instagram: instagram ?? this.instagram,
      facebook: facebook ?? this.facebook,
      tiktok: tiktok ?? this.tiktok,
      themeColor: themeColor ?? this.themeColor,
      viewsCount: viewsCount ?? this.viewsCount,
      productsCount: productsCount ?? this.productsCount,
      rating: rating ?? this.rating,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
