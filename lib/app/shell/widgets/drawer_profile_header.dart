import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/widgets/initial_avatar.dart';
import '../../../features/auth/domain/entities/user_summary.dart';

class DrawerProfileHeader extends StatelessWidget {
  final UserSummary user;
  final VoidCallback onClose;

  const DrawerProfileHeader({
    super.key,
    required this.user,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: AppColors.primaryDark,
      padding: EdgeInsets.fromLTRB(
        AppSizes.lg,
        MediaQuery.paddingOf(context).top + AppSizes.lg,
        AppSizes.lg,
        AppSizes.xl,
      ),
      child: Row(
        children: [
          InitialAvatar(name: user.name, size: 52),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'رقم الملف: ${user.fileNumber}',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.75),
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.white.withValues(alpha: 0.15),
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onClose,
              child: const SizedBox(
                width: AppSizes.circleButton,
                height: AppSizes.circleButton,
                child: Icon(LucideIcons.x, size: 22, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}