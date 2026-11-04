import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_logo.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppLogo(),
        const SizedBox(height: AppSizes.sm),
        Text('سجّل بياناتك', style: Theme.of(context).textTheme.headlineLarge),
      ],
    );
  }
}