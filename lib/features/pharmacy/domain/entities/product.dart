import 'package:equatable/equatable.dart';

enum ProductColor { teal, amber, pink, purple }

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final String details;
  final String size;
  final String category;
  final double price;
  final ProductColor color;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.details,
    required this.size,
    required this.category,
    required this.price,
    required this.color,
  });

  @override
  List<Object?> get props =>
      [id, name, description, details, size, category, price, color];
}