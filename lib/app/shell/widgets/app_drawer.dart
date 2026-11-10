import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/widgets/count_badge.dart';
import '../../../features/auth/data/datasources/sample_user_data.dart';
import '../../router/app_routes.dart';
import '../drawer_actions.dart';
import '../shell_actions.dart';
import 'drawer_item.dart';
import 'drawer_profile_header.dart';

class AppDrawer extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppDrawer({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final current = navigationShell.currentIndex;

    return Drawer(
      child: Column(
        children: [
          DrawerProfileHeader(user: sampleUser, onClose: closeDrawer),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.md,
                AppSizes.md,
                AppSizes.md,
                AppSizes.md,
              ),
              children: [
                DrawerItem(
                  icon: LucideIcons.house,
                  label: 'الرئيسية',
                  selected: current == 0,
                  onTap: () => selectDrawerTab(navigationShell, 0),
                ),
                DrawerItem(
                  icon: LucideIcons.briefcaseMedical,
                  label: 'الأطباء',
                  selected: current == 1,
                  onTap: () => selectDrawerTab(navigationShell, 1),
                ),
                DrawerItem(
                  icon: LucideIcons.calendar,
                  label: 'حجز موعد',
                  onTap: () => openDrawerRoute(context, AppRoutes.bookAppointment),
                ),
                DrawerItem(
                  icon: LucideIcons.fileText,
                  label: 'السجل الطبي',
                  selected: current == 2,
                  onTap: () => selectDrawerTab(navigationShell, 2),
                ),
                DrawerItem(
                  icon: LucideIcons.pill,
                  label: 'الأدوية',
                  selected: current == 3,
                  onTap: () => selectDrawerTab(navigationShell, 3),
                ),
                DrawerItem(
                  icon: LucideIcons.shoppingCart,
                  label: 'العربة',
                  onTap: () => openDrawerCart(context),
                ),
                DrawerItem(
                  icon: LucideIcons.bell,
                  label: 'الإشعارات',
                  trailing: const CountBadge(count: sampleUnreadNotifications),
                  onTap: () => openDrawerRoute(context, AppRoutes.notifications),
                ),
                DrawerItem(
                  icon: LucideIcons.user,
                  label: 'حسابي',
                  selected: current == 4,
                  onTap: () => selectDrawerTab(navigationShell, 4),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.md,
                AppSizes.md,
                AppSizes.md,
                AppSizes.sm,
              ),
              child: Column(
                children: [
                  DrawerItem(
                    icon: Icons.help_outline_rounded,
                    label: 'الدعم والمساعدة',
                    onTap: () => openDrawerRoute(context, AppRoutes.support),
                  ),
                  DrawerItem(
                    icon: LucideIcons.logOut,
                    label: 'تسجيل الخروج',
                    color: AppColors.error,
                    onTap: () => logout(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}