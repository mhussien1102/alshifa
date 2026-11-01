import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../widgets/login_footer.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.authPadding,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: AppSizes.xxxl + AppSizes.sm),
                    const LoginHeader(),
                    const SizedBox(height: AppSizes.xxxl),
                    const LoginForm(),
                    const Spacer(),
                    const LoginFooter(),
                    const SizedBox(height: AppSizes.xxxl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}