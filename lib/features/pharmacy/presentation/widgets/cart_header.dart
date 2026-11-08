import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/formaters.dart';
import '../../../../core/widgets/app_back_button.dart';

class CartHeader extends StatelessWidget {
  final int count;

  const CartHeader({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        const AppBackButton(),
        const SizedBox(width: AppSizes.md),
        Text('العربة', style: textTheme.headlineMedium),
        const Spacer(),
        Text(
          Formatters.itemsCount(count),
          style: textTheme.bodyMedium?.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}