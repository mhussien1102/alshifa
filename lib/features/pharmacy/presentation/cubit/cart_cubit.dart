import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cart_item.dart';
import '../../domain/entities/product.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void add(Product product) {
    final items = [...state.items];
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      items.add(CartItem(product: product, quantity: 1));
    } else {
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
    }
    emit(CartState(items: items));
  }

  void increment(String productId) {
    final index = state.items.indexWhere((item) => item.product.id == productId);
    if (index == -1) return;
    add(state.items[index].product);
  }

  void decrement(String productId) {
    final items = [...state.items];
    final index = items.indexWhere((item) => item.product.id == productId);
    if (index == -1) return;
    final quantity = items[index].quantity;
    if (quantity <= 1) {
      items.removeAt(index);
    } else {
      items[index] = items[index].copyWith(quantity: quantity - 1);
    }
    emit(CartState(items: items));
  }

  void clear() => emit(const CartState());
}