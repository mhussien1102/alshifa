import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/app_bottom_nav.dart';
import 'shell_actions.dart';
import 'shell_keys.dart';
import 'widgets/app_drawer.dart';

class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainScaffoldKey,
      body: navigationShell,
      endDrawer: AppDrawer(navigationShell: navigationShell),
      bottomNavigationBar: AppBottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => switchTab(navigationShell, index),
      ),
    );
  }
}