import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class ProductBottle extends StatelessWidget {
  final ProductColorScheme scheme;
  final double height;

  const ProductBottle({super.key, required this.scheme, this.height = 69});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.bottle(scheme), height: height);
  }
}