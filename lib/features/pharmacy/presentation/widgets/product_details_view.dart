import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/formaters.dart';
import '../../../../core/utils/render_utils.dart';
import '../../../../core/widgets/status_badge.dart';
import '../../domain/entities/product.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';
import '../utils/pharmacy_actions.dart';
import 'product_details_bottom_bar.dart';
import 'product_details_header.dart';
import 'product_image_tile.dart';
import 'product_info_table.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final _cartKey = GlobalKey();
  final _imageKey = GlobalKey();
  int _pending = 0;
  int _bump = 0;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final scheme = ProductColorScheme.values.byName(product.color.name);
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cart) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSizes.xxl),
                    ProductDetailsHeader(
                      cartCount: visibleCartCount(cart.totalQuantity, _pending),
                      bumpCount: _bump,
                      cartKey: _cartKey,
                    ),
                    const SizedBox(height: AppSizes.lg),
                    ProductImageTile(
                      key: _imageKey,
                      scheme: scheme,
                      height: 260,
                      radius: AppSizes.radiusHero,
                      bottleScale: 0.646,
                    ),
                    const SizedBox(height: AppSizes.lg),
                    const StatusBadge(text: 'متاح الآن'),
                    const SizedBox(height: AppSizes.sm),
                    Text(
                      product.name,
                      style: textTheme.headlineLarge?.copyWith(fontSize: 26),
                    ),
                    const SizedBox(height: AppSizes.xs),
                    Text(
                      Formatters.price(product.price),
                      style: AppTextStyles.price.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppSizes.sm),
                    Text(
                      product.details,
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: AppSizes.lg),
                    ProductInfoTable(
                      size: product.size,
                      category: product.category,
                    ),
                    const SizedBox(height: AppSizes.lg),
                  ],
                ),
              ),
            ),
            ProductDetailsBottomBar(
              quantity: cart.quantityOf(product.id),
              onAdd: () {
                final from = globalRectOf(_imageKey);
                if (from != null) setState(() => _pending++);
                context.read<CartCubit>().add(product);
                flyProductToCart(
                  context: context,
                  product: product,
                  from: from,
                  cartKey: _cartKey,
                  radius: AppSizes.radiusHero,
                  bottleScale: 0.646,
                  onLanded: () {
                    if (!mounted) return;
                    setState(() {
                      _pending--;
                      _bump++;
                    });
                  },
                );
              },
              onIncrement: () => context.read<CartCubit>().increment(product.id),
              onDecrement: () => context.read<CartCubit>().decrement(product.id),
              onViewCart: () => openCart(context),
            ),
          ],
        );
      },
    );
  }
}