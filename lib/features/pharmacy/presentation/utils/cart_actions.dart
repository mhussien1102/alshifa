import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import 'payment_actions.dart';

void completeOrder(BuildContext context) {
  showPaymentSheet(context, context.read<CartCubit>().state.totalPrice);
}