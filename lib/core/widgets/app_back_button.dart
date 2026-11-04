import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../utils/navigation_actions.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      clipBehavior: Clip.antiAlias,
      shape: const CircleBorder(side: BorderSide(color: AppColors.border)),
      child: InkWell(
        onTap: () => goBack(context),
        child: const SizedBox(
          width: AppSizes.backButton,
          height: AppSizes.backButton,
          child: Icon(
            LucideIcons.chevronRight,
            size: 22,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}