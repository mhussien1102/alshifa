import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../utils/splash_actions.dart';
import 'splash_loading_bar.dart';

class SplashBottomSection extends StatefulWidget {
  const SplashBottomSection({super.key});

  @override
  State<SplashBottomSection> createState() => _SplashBottomSectionState();
}

class _SplashBottomSectionState extends State<SplashBottomSection> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: _loaded
          ? CustomButton(
        key: const ValueKey('start'),
        text: 'ابدأ',
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.primaryDark,
        onPressed: () => goToLogin(context),
      )
          : SplashLoadingBar(
        key: const ValueKey('loading'),
        onCompleted: () {
          if (mounted) setState(() => _loaded = true);
        },
      ),
    );
  }
}