import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../widgets/birth_date_sheet.dart';

Future<void> pickBirthDate(
    BuildContext context, {
      DateTime? initialDate,
      required ValueChanged<DateTime> onPicked,
    }) async {
  final picked = await showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: true,
    builder: (_) => BirthDateSheet(initialDate: initialDate),
  );
  if (picked != null) onPicked(picked);
}

void submitRegister(
    BuildContext context,
    GlobalKey<FormState> formKey,
    String email,
    ) {
  if (formKey.currentState?.validate() ?? false) {
    context.push(AppRoutes.otp, extra: email);
  }
}

void goToLogin(BuildContext context) {
  context.go(AppRoutes.login);
}