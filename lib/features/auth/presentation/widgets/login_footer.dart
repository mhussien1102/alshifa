import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/theme/app_text_style.dart';
import '../utils/login_actions.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'إذا لم يكن لديك حساب',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
        ),
        const SizedBox(width: AppSizes.xs),
        TextButton(
          onPressed: () => goToRegister(context),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: AppTextStyles.link.copyWith(fontSize: 16),
          ),
          child: const Text('إنشاء حساب'),
        ),
      ],
    );
  }
}