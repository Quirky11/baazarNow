
import 'package:equatable/equatable.dart';
// Represents a product in the Bazaar Buddy application.
class ProductModel extends Equatable {
 // Unique identifier for the product.
  final String id;

  // Name of the product.
  final String name;

  // Price of the product.
  final double price;

  // Category of the product.
  final String category;

  // ID of the vendor who sells this product.
  final String vendorId;

  // Description of the product.
  final String description;

  // Constructor for the ProductModel class.
  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.vendorId,
    required this.description,
  });
  
    @override
  List<Object?> get props => [
        id,
        name,price,category,vendorId,description
      ];
  // Factory constructor to create a ProductModel instance from a JSON map.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(), // Convert num to double.
      category: json['category'] as String,
      vendorId: json['vendorId'] as String,
      description: json['description'] as String,
    );
  }
}