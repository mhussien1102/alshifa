import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_size.dart';
import '../../domain/entities/payment_method.dart';
import 'payment_method_tile.dart';

class PaymentMethodSelector extends StatelessWidget {
  final PaymentMethod selected;
  final ValueChanged<PaymentMethod> onChanged;

  const PaymentMethodSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  static const _labels = {
    PaymentMethod.visa: 'فيزا',
    PaymentMethod.paypal: 'PayPal',
    PaymentMethod.vodafoneCash: 'فودافون كاش',
    PaymentMethod.cash: 'كاش',
  };

  static const _icons = {
    PaymentMethod.visa: LucideIcons.creditCard,
    PaymentMethod.cash: LucideIcons.banknote,
  };

  @override
  Widget build(BuildContext context) {
    final methods = PaymentMethod.values;

    return Row(
      children: [
        for (var i = 0; i < methods.length; i++) ...[
          if (i > 0) const SizedBox(width: AppSizes.sm),
          Expanded(
            child: PaymentMethodTile(
              label: _labels[methods[i]]!,
              icon: _icons[methods[i]],
              selected: methods[i] == selected,
              onTap: () => onChanged(methods[i]),
            ),
          ),
        ],
      ],
    );
  }
}