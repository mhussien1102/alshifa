import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/ui_message.dart';

void sendCode(BuildContext context) {
  showAppMessage(context, 'تم إرسال الرمز إلى بريدك الإلكتروني');
}

void sendResetCode(BuildContext context, GlobalKey<FormState> formKey) {
  if (formKey.currentState?.validate() ?? false) sendCode(context);
}

void submitConfirmAccount(BuildContext context, TextEditingController otp) {
  if (otp.text.length != AppConstants.otpLength) {
    showAppMessage(context, 'أدخل رمز التحقق المكوّن من ٦ أرقام');
    return;
  }
  context.go(AppRoutes.home);
}

void submitForgotPassword(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController otp,
    ) {
  if (!(formKey.currentState?.validate() ?? false)) return;
  if (otp.text.length != AppConstants.otpLength) {
    showAppMessage(context, 'أدخل رمز التحقق المكوّن من ٦ أرقام');
    return;
  }
  context.push(AppRoutes.resetPassword);
}