import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/widgets/app_circle_button.dart';
import '../shell_actions.dart';

class AppMenuButton extends StatelessWidget {
  const AppMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCircleButton(
      icon: LucideIcons.menu,
      onPressed: openDrawer,
    );
  }
}