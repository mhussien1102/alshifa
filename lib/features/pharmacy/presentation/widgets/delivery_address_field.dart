import 'package:flutter/material.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';

class DeliveryAddressField extends StatelessWidget {
  final TextEditingController controller;

  const DeliveryAddressField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: 'عنوان التوصيل',
      hint: 'المحافظة، المدينة، الشارع، رقم المبنى والشقة',
      controller: controller,
      compact: true,
      maxLines: 2,
      keyboardType: TextInputType.streetAddress,
      validator: (value) => Validators.required(value, 'عنوان التوصيل'),
    );
  }
}