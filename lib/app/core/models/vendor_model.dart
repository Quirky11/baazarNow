
// VendorModel class to represent a vendor in the Bazaar Buddy app.
import 'package:equatable/equatable.dart';
class VendorModel extends Equatable {
  // Unique identifier for the vendor.
  final String id;
  // Name of the vendor.
  final String name;
  // List of products the vendor offers.
  final List<String> products;
  // Location of the vendor.
  final String location;
  // Contact information for the vendor.
  final String contact;
  // Rating of the vendor.
  final double rating;

  // Constructor for the VendorModel class.
  const VendorModel({
    required this.id,
    required this.name,
    required this.products,
    required this.location,
    required this.contact,
    required this.rating,
  });

  // Method to convert a JSON object to a VendorModel instance.
  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      products: (json['products'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as String,
      contact: json['contact'] as String,
      rating: json['rating'] as double,
    );
  }

  @override
  List<Object?> get props => [id, name, products, location, contact, rating];
}