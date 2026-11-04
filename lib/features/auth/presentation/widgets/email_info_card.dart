import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';

class EmailInfoCard extends StatelessWidget {
  final String email;

  const EmailInfoCard({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            'سوف يتم إرسال رمز على بريدك الإلكتروني الذي سجلته، يرجى التحقق من الإيميل الخاص بك',
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(fontSize: 15, height: 1.7),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            email,
            textDirection: TextDirection.ltr,
            style: textTheme.titleMedium?.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}