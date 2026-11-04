import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/utils/ui_message.dart';

void submitNewPassword(BuildContext context, GlobalKey<FormState> formKey) {
  if (!(formKey.currentState?.validate() ?? false)) return;
  showAppMessage(context, 'تم حفظ كلمة السر الجديدة');
  context.go(AppRoutes.home);
}