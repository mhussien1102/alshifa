import 'package:equatable/equatable.dart';

enum ProductColor { teal, amber, pink, purple }

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final ProductColor color;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });

  @override
  List<Object?> get props => [id, name, description, price, color];
}