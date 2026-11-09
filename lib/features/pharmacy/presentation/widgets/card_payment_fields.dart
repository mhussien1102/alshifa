import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/input_formatters.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';

class CardPaymentFields extends StatelessWidget {
  final TextEditingController numberController;
  final TextEditingController holderController;
  final TextEditingController expiryController;
  final TextEditingController cvvController;

  const CardPaymentFields({
    super.key,
    required this.numberController,
    required this.holderController,
    required this.expiryController,
    required this.cvvController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'رقم البطاقة',
          hint: '0000 0000 0000 0000',
          controller: numberController,
          compact: true,
          keyboardType: TextInputType.number,
          inputFormatters: [CardNumberFormatter()],
          validator: Validators.cardNumber,
        ),
        const SizedBox(height: AppSizes.lg),
        CustomTextField(
          label: 'اسم حامل البطاقة',
          hint: 'الاسم كما هو مكتوب على البطاقة',
          controller: holderController,
          compact: true,
          keyboardType: TextInputType.name,
          validator: (value) => Validators.required(value, 'اسم حامل البطاقة'),
        ),
        const SizedBox(height: AppSizes.lg),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextField(
                label: 'تاريخ الانتهاء',
                hint: 'MM / YY',
                controller: expiryController,
                compact: true,
                keyboardType: TextInputType.number,
                inputFormatters: [ExpiryDateFormatter()],
                validator: Validators.expiry,
              ),
            ),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: CustomTextField(
                label: 'رمز الأمان CVV',
                hint: '•••',
                controller: cvvController,
                compact: true,
                obscureText: true,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                validator: Validators.cvv,
              ),
            ),
          ],
        ),
      ],
    );
  }
}