import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/navigation_actions.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';
import '../utils/cart_actions.dart';
import 'cart_header.dart';
import 'cart_item_card.dart';
import 'cart_summary.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen: (previous, current) => !previous.isEmpty && current.isEmpty,
      listener: (context, state) => goBack(context),
      builder: (context, cart) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.screenPadding,
              ),
              child: Column(
                children: [
                  const SizedBox(height: AppSizes.xxl),
                  CartHeader(count: cart.totalQuantity),
                  const SizedBox(height: AppSizes.md),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.screenPadding,
                  AppSizes.xs,
                  AppSizes.screenPadding,
                  AppSizes.lg,
                ),
                itemCount: cart.items.length,
                separatorBuilder: (context, index) =>
                const SizedBox(height: AppSizes.md),
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return CartItemCard(
                    key: ValueKey(item.product.id),
                    item: item,
                    onIncrement: () =>
                        context.read<CartCubit>().increment(item.product.id),
                    onDecrement: () =>
                        context.read<CartCubit>().decrement(item.product.id),
                  );
                },
              ),
            ),
            CartSummary(
              total: cart.totalPrice,
              onCheckout: () => completeOrder(context),
            ),
          ],
        );
      },
    );
  }
}