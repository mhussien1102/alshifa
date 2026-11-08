import 'app_colors.dart';

abstract final class AppAssets {
  static const logo = 'assets/images/logo.svg';
  static const logoTeal = 'assets/images/logo_teal.svg';

  static String bottle(ProductColorScheme scheme) =>
      'assets/images/bottle_${scheme.name}.svg';
}