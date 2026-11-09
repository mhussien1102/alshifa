import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../constants/app_colors.dart';

class SheetHeader extends StatelessWidget {
  final String title;
  final VoidCallback onClose;

  const SheetHeader({super.key, required this.title, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
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