import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';

class PaymentPhoneField extends StatelessWidget {
  final String label;
  final String helperText;
  final TextEditingController controller;

  const PaymentPhoneField({
    super.key,
    required this.label,
    required this.helperText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: label,
      hint: '01XXXXXXXXX',
      helperText: helperText,
      controller: controller,
      compact: true,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
      ],
      validator: Validators.phone,
    );
  }
}