import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';

class BirthDateSheetHeader extends StatelessWidget {
  final VoidCallback onClose;

  const BirthDateSheetHeader({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'تاريخ الميلاد',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 22),
          ),
        ),
        Material(
          color: AppColors.disabledFill,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onClose,
            child: const SizedBox(
              width: 44,
              height: 44,
              child: Icon(
                LucideIcons.x,
                size: 22,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}