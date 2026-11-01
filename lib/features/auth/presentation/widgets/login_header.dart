import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SvgPicture.asset(
          AppAssets.logo,
          width: AppSizes.authLogo,
          height: AppSizes.authLogo,
        ),
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