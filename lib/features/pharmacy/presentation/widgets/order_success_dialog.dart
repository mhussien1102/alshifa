import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/icon_tile.dart';

class OrderSuccessDialog extends StatelessWidget {
  const OrderSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: AppColors.surface,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.authPadding,
        vertical: AppSizes.xxl,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSheet),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconTile(
              icon: LucideIcons.check,
              iconSize: 36,
              background: AppColors.success.withValues(alpha: 0.12),
              iconColor: AppColors.success,
            ),
            const SizedBox(height: AppSizes.lg),
            Text('تم إتمام الطلب', style: textTheme.headlineMedium),
            const SizedBox(height: AppSizes.sm),
            Text(
              'شكرًا لك، تم استلام طلبك وسيتم تجهيزه وتوصيله في أقرب وقت.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.6),
            ),
            const SizedBox(height: AppSizes.xxl),
            CustomButton(
              text: 'العودة إلى المتجر',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}