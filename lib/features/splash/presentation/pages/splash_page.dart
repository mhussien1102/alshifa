import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../widgets/splash_loading_bar.dart';
import '../widgets/splash_logo.dart';
import '../widgets/splash_rings.dart';

/// شاشة البداية - ديزاين فقط (من غير Cubit أو Navigation)
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

          // اللوجو + الاسم + الشعار
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

          // شريط التحميل
          const Positioned(
            left: 0,
            right: 0,
            bottom: AppSizes.xxxl * 2 + AppSizes.sm,
            child: SplashLoadingBar(),
          ),
        ],
      ),
    );
  }
}