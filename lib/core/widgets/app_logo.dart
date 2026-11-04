import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_assets.dart';
import '../constants/app_size.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({super.key, this.size = AppSizes.logo});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.logoTeal, width: size, height: size);
  }
}