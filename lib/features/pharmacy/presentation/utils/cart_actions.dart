import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/ui_message.dart';
import '../cubit/cart_cubit.dart';

void completeOrder(BuildContext context) {
  showAppMessage(context, 'تم إرسال طلبك بنجاح');
  context.read<CartCubit>().clear();
}