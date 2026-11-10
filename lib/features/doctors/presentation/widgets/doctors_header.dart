import 'package:flutter/material.dart';

import '../../../../app/shell/widgets/app_menu_button.dart';

class DoctorsHeader extends StatelessWidget {
  const DoctorsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('الأطباء', style: Theme.of(context).textTheme.headlineMedium),
        const Spacer(),
        const AppMenuButton(),
      ],
    );
  }
}