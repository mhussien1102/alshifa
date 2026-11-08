import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_search_bar.dart';
import '../../data/datasources/products_sample_data.dart';
import '../utils/pharmacy_actions.dart';
import '../utils/quantity_actions.dart';
import 'pharmacy_header.dart';
import 'products_grid.dart';

class PharmacyView extends StatefulWidget {
  const PharmacyView({super.key});

  @override
  State<PharmacyView> createState() => _PharmacyViewState();
}

class _PharmacyViewState extends State<PharmacyView> {
  final _cartKey = GlobalKey();
  Map<String, int> _quantities = {};
  int _pending = 0;
  int _bump = 0;

  @override
  Widget build(BuildContext context) {
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
                cartCount: visibleCartCount(_quantities, _pending),
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
            quantities: _quantities,
            onAdd: (product, from) {
              setState(() {
                _quantities = incrementQuantity(_quantities, product.id);
                if (from != null) _pending++;
              });
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
            onIncrement: (id) =>
                setState(() => _quantities = incrementQuantity(_quantities, id)),
            onDecrement: (id) =>
                setState(() => _quantities = decrementQuantity(_quantities, id)),
          ),
        ),
      ],
    );
  }
}