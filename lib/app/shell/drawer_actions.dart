import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/pharmacy/presentation/cubit/cart_cubit.dart';
import '../../features/pharmacy/presentation/utils/pharmacy_actions.dart';
import '../router/app_routes.dart';
import 'shell_actions.dart';

void selectDrawerTab(StatefulNavigationShell shell, int index) {
  closeDrawer();
  switchTab(shell, index);
}

void openDrawerRoute(BuildContext context, String route) {
  closeDrawer();
  context.push(route);
}

void openDrawerCart(BuildContext context) {
  closeDrawer();
  openCart(context);
}

void logout(BuildContext context) {
  context.read<CartCubit>().clear();
  context.go(AppRoutes.login);
}