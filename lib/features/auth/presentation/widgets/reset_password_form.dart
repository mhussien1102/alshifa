import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_back_button.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../utils/reset_password_actions.dart';
import 'auth_icon_header.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.authPadding),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: AppSizes.lg),
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: AppBackButton(),
                    ),
                    const SizedBox(height: AppSizes.xxl),
                    const AuthIconHeader(
                      icon: LucideIcons.shieldCheck,
                      title: 'كلمة سر جديدة',
                      subtitle: 'تم التحقق من الرمز بنجاح. اختر كلمة سر جديدة لحسابك.',
                    ),
                    const SizedBox(height: AppSizes.xxl),
                    CustomTextField(
                      label: 'كلمة السر الجديدة',
                      hint: '••••••••',
                      controller: _passwordController,
                      isPassword: true,
                      helperText: '٨ أحرف على الأقل، وتحتوي على أرقام',
                      validator: Validators.password,
                    ),
                    const SizedBox(height: AppSizes.lg),
                    CustomTextField(
                      label: 'تأكيد كلمة السر',
                      hint: '••••••••',
                      controller: _confirmPasswordController,
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      validator: (value) => Validators.confirmPassword(
                        value,
                        _passwordController.text,
                      ),
                      onSubmitted: (_) =>
                          submitNewPassword(context, _formKey),
                    ),
                    const SizedBox(height: AppSizes.xl),
                  ],
                ),
              ),
            ),
            CustomButton(
              text: 'حفظ والدخول',
              onPressed: () => submitNewPassword(context, _formKey),
            ),
            const SizedBox(height: AppSizes.xxl),
          ],
        ),
      ),
    );
  }
}