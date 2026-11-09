import 'package:flutter/material.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';

class PaypalPaymentFields extends StatelessWidget {
  final TextEditingController emailController;

  const PaypalPaymentFields({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: 'البريد الإلكتروني لحساب PayPal',
      hint: 'name@example.com',
      helperText: 'سيتم تحويلك إلى PayPal لتأكيد الدفع.',
      controller: emailController,
      compact: true,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      validator: Validators.email,
    );
  }
}