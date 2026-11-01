import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../widgets/splash_buttom_sections.dart';
import '../widgets/splash_logo.dart';
import '../widgets/splash_rings.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Stack(
        children: [
          const Positioned.fill(child: SplashRings()),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: height * 0.268),
                const SplashLogo(),
                const SizedBox(height: AppSizes.xxxl),
                Text(
                  'مستشفى الشفاء',
                  style: textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: AppSizes.sm),
                Text(
                  'رعايتك الصحية، في يدك',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            left: AppSizes.authPadding,
            right: AppSizes.authPadding,
            bottom: AppSizes.xxxl * 2,
            child: SplashBottomSection(),
          ),
        ],
      ),
    );
  }
}