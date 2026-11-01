import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';

void submitLogin(BuildContext context, GlobalKey<FormState> formKey) {
  if (formKey.currentState?.validate() ?? false) {
    context.go(AppRoutes.home);
  }
}

void goToRegister(BuildContext context) {
  context.push(AppRoutes.register);
}

void goToForgotPassword(BuildContext context) {
  context.push(AppRoutes.forgotPassword);
}