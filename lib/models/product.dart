class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? discount; // Optional discount percentage
  final String? imagePath; // Local path or URL
  final DateTime createdAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.discount,
    this.imagePath,
    required this.createdAt,
  });

  // Calculate final price after discount
  double get finalPrice {
    if (discount != null && discount! > 0) {
      return price - (price * discount! / 100);
    }
    return price;
  }

  // Check if product has discount
  bool get hasDiscount => discount != null && discount! > 0;

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'imagePath': imagePath,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discount: json['discount'] != null
          ? (json['discount'] as num).toDouble()
          : null,
      imagePath: json['imagePath'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  // Copy with method for updates
  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? discount,
    String? imagePath,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
