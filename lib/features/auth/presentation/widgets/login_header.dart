import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_logo.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const AppLogo(size: AppSizes.authLogo),
        const SizedBox(height: AppSizes.lg),
        Text(
          'مستشفى الشفاء',
          style: textTheme.labelLarge?.copyWith(
            color: AppColors.primary,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: AppSizes.lg),
        Text('أهلاً بعودتك', style: textTheme.headlineLarge),
      ],
    );
  }
}