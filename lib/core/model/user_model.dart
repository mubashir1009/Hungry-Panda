class UserModel {
  final String? id;
  final String name;
  final String contact;
  final String email;
  final String? imageUrl;
  final String? address;

  UserModel({
    this.id,
    required this.name,
    required this.contact,
    required this.imageUrl,
    required this.email,
    this.address,
  });

  factory UserModel.fromMap(Map<String, dynamic> json, String id) {
    return UserModel(
      id: id,
      name: json['name'],
      contact: json['contact'],
      imageUrl: json['imageUrl'],
      email: json['email'],
      address: json['address'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'contact': contact,
      'imageUrl': imageUrl,
      'address': address,
    };
  }

  UserModel copyWith({
    final String? id,
    final String? name,
    final String? contact,
    final String? email,
    final String? imageUrl,
    final String? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      contact: contact ?? this.contact,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      address: address ?? this.address,
    );
  }
}
