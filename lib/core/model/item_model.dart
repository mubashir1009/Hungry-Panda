class ItemModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final int quantity;

  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });

  ItemModel copyWith(
    {final String? id,
    final String? name,
    final String? description,
    final double? price,
    final int? quantity,}
  ) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity?? this.quantity
    );
  }


}
