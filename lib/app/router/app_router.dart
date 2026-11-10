import 'package:go_router/go_router.dart';

import '../../core/widgets/placeholder_page.dart';
import '../../features/auth/presentation/pages/confirm_account_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/doctors/presentation/pages/doctors_page.dart';
import '../../features/pharmacy/domain/entities/product.dart';
import '../../features/pharmacy/presentation/pages/cart_page.dart';
import '../../features/pharmacy/presentation/pages/pharmacy_page.dart';
import '../../features/pharmacy/presentation/pages/product_details_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../shell/main_shell.dart';
import '../shell/widgets/app_menu_button.dart';
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
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.otp,
        builder: (context, state) =>
            ConfirmAccountPage(email: state.extra as String? ?? ''),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const PlaceholderPage(
                  title: 'الرئيسية',
                  action: AppMenuButton(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.doctors,
                builder: (context, state) => const DoctorsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.records,
                builder: (context, state) => const PlaceholderPage(
                  title: 'السجل الطبي',
                  action: AppMenuButton(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.pharmacy,
                builder: (context, state) => const PharmacyPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const PlaceholderPage(
                  title: 'حسابي',
                  action: AppMenuButton(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.bookAppointment,
        builder: (context, state) => const PlaceholderPage(title: 'حجز موعد'),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const PlaceholderPage(title: 'الإشعارات'),
      ),
      GoRoute(
        path: AppRoutes.support,
        builder: (context, state) =>
        const PlaceholderPage(title: 'الدعم والمساعدة'),
      ),
      GoRoute(
        path: AppRoutes.productDetails,
        builder: (context, state) {
          final product = state.extra as Product?;
          if (product == null) {
            return const PlaceholderPage(title: 'المنتج غير موجود');
          }
          return ProductDetailsPage(product: product);
        },
      ),
      GoRoute(
        path: AppRoutes.cart,
        builder: (context, state) => const CartPage(),
      ),
    ],
  );
}