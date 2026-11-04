import 'package:flutter/material.dart';

import '../widgets/confirm_account_form.dart';

class ConfirmAccountPage extends StatelessWidget {
  final String email;

  const ConfirmAccountPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ConfirmAccountForm(email: email)),
    );
  }
}