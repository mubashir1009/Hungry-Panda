class CategoryModel {
  final String? id;
  final String name;
  final String imagePath;
  final bool isSelected;

  CategoryModel({
    this.id,
    required this.name,
    required this.isSelected,
    required this.imagePath,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json, String id) {
    return CategoryModel(
      id: id,
      name: json['name'],
      isSelected: false,
      imagePath: json['image_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'is_selected': isSelected,
      'image_path': imagePath,
    };
  }

  CategoryModel copyWith({
    final String? id,
    final String? name,
    final bool? isSelected,
    final String? imagePath,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
