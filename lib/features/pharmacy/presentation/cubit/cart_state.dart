import 'package:equatable/equatable.dart';

import '../../domain/entities/cart_item.dart';

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  bool get isEmpty => items.isEmpty;

  int get totalQuantity =>
      items.fold<int>(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      items.fold<double>(0, (sum, item) => sum + item.lineTotal);

  Map<String, int> get quantities => {
    for (final item in items) item.product.id: item.quantity,
  };

  @override
  List<Object?> get props => [items];
}