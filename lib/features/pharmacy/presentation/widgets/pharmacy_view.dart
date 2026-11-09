import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_search_bar.dart';
import '../../data/datasources/products_sample_data.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';
import '../utils/pharmacy_actions.dart';
import 'pharmacy_header.dart';
import 'products_grid.dart';

class PharmacyView extends StatefulWidget {
  const PharmacyView({super.key});

  @override
  State<PharmacyView> createState() => _PharmacyViewState();
}

class _PharmacyViewState extends State<PharmacyView> {
  final _cartKey = GlobalKey();
  int _pending = 0;
  int _bump = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
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
                  PharmacyHeader(
                    cartCount: visibleCartCount(cart.totalQuantity, _pending),
                    bumpCount: _bump,
                    cartKey: _cartKey,
                  ),
                  const SizedBox(height: AppSizes.md),
                  const AppSearchBar(hint: 'ابحث عن دواء أو منتج'),
                  const SizedBox(height: AppSizes.md),
                ],
              ),
            ),
            Expanded(
              child: ProductsGrid(
                products: sampleProducts,
                quantities: cart.quantities,
                onOpen: (product) => openProductDetails(context, product),
                onAdd: (product, from) {
                  if (from != null) setState(() => _pending++);
                  context.read<CartCubit>().add(product);
                  flyProductToCart(
                    context: context,
                    product: product,
                    from: from,
                    cartKey: _cartKey,
                    onLanded: () {
                      if (!mounted) return;
                      setState(() {
                        _pending--;
                        _bump++;
                      });
                    },
                  );
                },
                onIncrement: (id) => context.read<CartCubit>().increment(id),
                onDecrement: (id) => context.read<CartCubit>().decrement(id),
              ),
            ),
          ],
        );
      },
    );
  }
}