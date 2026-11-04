import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/icon_tile.dart';

class AuthIconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const AuthIconHeader({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        IconTile(icon: icon),
        const SizedBox(height: AppSizes.md),
        Text(title, style: textTheme.headlineLarge, textAlign: TextAlign.center),
        if (subtitle != null) ...[
          const SizedBox(height: AppSizes.sm),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(fontSize: 15),
          ),
        ],
      ],
    );
  }
}