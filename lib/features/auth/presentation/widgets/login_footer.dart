import 'package:flutter/material.dart';

import '../../../../core/widgets/text_link_row.dart';
import '../utils/login_actions.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return TextLinkRow(
      text: 'إذا لم يكن لديك حساب',
      linkText: 'إنشاء حساب',
      onPressed: () => goToRegister(context),
    );
  }
}