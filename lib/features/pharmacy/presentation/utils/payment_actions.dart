import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import '../widgets/order_success_dialog.dart';
import '../widgets/payment_sheet.dart';

Future<void> showPaymentSheet(BuildContext context, double total) async {
  final completed = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => PaymentSheet(total: total),
  );
  if (completed == true && context.mounted) {
    await showOrderSuccess(context);
  }
}

void submitPayment(BuildContext context, GlobalKey<FormState> formKey) {
  if (formKey.currentState?.validate() ?? false) {
    Navigator.of(context).pop(true);
  }
}

Future<void> showOrderSuccess(BuildContext context) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => const OrderSuccessDialog(),
  );
  if (context.mounted) context.read<CartCubit>().clear();
}