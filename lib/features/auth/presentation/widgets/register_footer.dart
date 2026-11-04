import 'package:flutter/material.dart';

import '../../../../core/widgets/text_link_row.dart';
import '../utils/register_actions.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return TextLinkRow(
      text: 'لديك حساب بالفعل؟',
      linkText: 'تسجيل الدخول',
      onPressed: () => goToLogin(context),
    );
  }
}