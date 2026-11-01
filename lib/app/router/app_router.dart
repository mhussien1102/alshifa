import 'package:go_router/go_router.dart';

import '../../core/widgets/placeholder_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const PlaceholderPage(title: 'إنشاء حساب'),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) =>
        const PlaceholderPage(title: 'نسيت كلمة السر؟'),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const PlaceholderPage(title: 'الرئيسية'),
      ),
    ],
  );
}