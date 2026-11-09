import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/sheet_header.dart';
import '../../domain/entities/payment_method.dart';
import '../utils/payment_actions.dart';
import 'card_payment_fields.dart';
import 'delivery_address_field.dart';
import 'payment_bottom_bar.dart';
import 'payment_method_selector.dart';
import 'payment_phone_field.dart';
import 'paypal_payment_fields.dart';

class PaymentSheet extends StatefulWidget {
  final double total;

  const PaymentSheet({super.key, required this.total});

  @override
  State<PaymentSheet> createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  final _formKey = GlobalKey<FormState>();
  PaymentMethod _method = PaymentMethod.visa;
  final _addressController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cardHolderController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _paypalController = TextEditingController();
  final _walletController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _paypalController.dispose();
    _walletController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.screenPadding,
                  AppSizes.lg,
                  AppSizes.screenPadding,
                  AppSizes.lg,
                ),
                child: Column(
                  children: [
                    SheetHeader(
                      title: 'اختاري طريقة الدفع',
                      onClose: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(height: AppSizes.md),
                    PaymentMethodSelector(
                      selected: _method,
                      onChanged: (method) => setState(() => _method = method),
                    ),
                    const SizedBox(height: AppSizes.lg),
                    DeliveryAddressField(controller: _addressController),
                    const SizedBox(height: AppSizes.lg),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      alignment: Alignment.topCenter,
                      child: switch (_method) {
                        PaymentMethod.visa => CardPaymentFields(
                          numberController: _cardNumberController,
                          holderController: _cardHolderController,
                          expiryController: _expiryController,
                          cvvController: _cvvController,
                        ),
                        PaymentMethod.paypal => PaypalPaymentFields(
                          emailController: _paypalController,
                        ),
                        PaymentMethod.vodafoneCash => PaymentPhoneField(
                          label: 'رقم محفظة فودافون كاش',
                          helperText: 'سيصلك طلب تأكيد الدفع على هذا الرقم.',
                          controller: _walletController,
                        ),
                        PaymentMethod.cash => PaymentPhoneField(
                          label: 'رقم التواصل',
                          helperText:
                          'سيتصل بك مندوب التوصيل على هذا الرقم، وتدفع عند الاستلام.',
                          controller: _phoneController,
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ),
            PaymentBottomBar(
              total: widget.total,
              method: _method,
              onPay: () => submitPayment(context, _formKey),
            ),
          ],
        ),
      ),
    );
  }
}