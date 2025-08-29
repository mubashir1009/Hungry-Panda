class ItemModel {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final String category;
  final double price;
  final double rating;
  final double discountPrice;
  final bool isDiscounted;
  final int quantity;

  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imagePath,
    required this.rating,
    required this.price,
    required this.quantity,
    required this.isDiscounted,
    required this.discountPrice,
  });
  factory ItemModel.fromMap(Map<String, dynamic> json, String id) {
    return ItemModel(
      id: id,
      name: json['name'],
      description: json['contact'],
      rating: json['rating'],
      price: json['price'],
      quantity: json['quantity'] ?? '',
      category: json['category'] ?? '',
      imagePath: json['image_path'] ?? '',
      discountPrice: json['discount_price'] ?? '',
      isDiscounted: json['is_discount'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'contact': description,
      'rating': rating,
      'price': price,
      'quantity': quantity,
      'category': category,
      'image_path': imagePath,
      'discount_price': discountPrice,
      'is_discount': isDiscounted,
    };
  }

  ItemModel copyWith({
    final String? id,
    final String? name,
    final String? description,
    final String? imagePath,
    final String? category,
    final double? price,
    final double? rating,
    final double? discountPrice,
    final bool? isDiscounted,
    final int? quantity,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imagePath: imagePath ?? this.imagePath,
      rating: rating ?? this.rating,
      isDiscounted: isDiscounted ?? this.isDiscounted,
      discountPrice: discountPrice ?? this.discountPrice,
    );
  }
}
