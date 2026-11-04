import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_back_button.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/otp_input.dart';
import '../../../../core/widgets/text_link_row.dart';
import '../utils/otp_actions.dart';
import 'auth_icon_header.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
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
                      icon: LucideIcons.lock,
                      title: 'نسيت كلمة السر؟',
                      subtitle:
                      'اكتب بريدك الإلكتروني ليصلك رمز التحقق، ثم أدخل الرمز لإنشاء كلمة سر جديدة.',
                    ),
                    const SizedBox(height: AppSizes.xxl),
                    CustomTextField(
                      label: 'البريد الإلكتروني',
                      hint: 'name@example.com',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: Validators.email,
                    ),
                    const SizedBox(height: AppSizes.md),
                    CustomButton(
                      text: 'إرسال الرمز',
                      type: CustomButtonType.outlined,
                      height: AppSizes.secondaryButtonHeight,
                      onPressed: () => sendResetCode(context, _formKey),
                    ),
                    const SizedBox(height: AppSizes.xxl),
                    OtpInput(label: 'رمز التحقق', controller: _otpController),
                    const SizedBox(height: AppSizes.xl),
                    TextLinkRow(
                      text: 'لم يصلك الرمز؟',
                      linkText: 'إعادة الإرسال',
                      onPressed: () => sendResetCode(context, _formKey),
                    ),
                    const SizedBox(height: AppSizes.xl),
                  ],
                ),
              ),
            ),
            CustomButton(
              text: 'تأكيد الرمز',
              onPressed: () =>
                  submitForgotPassword(context, _formKey, _otpController),
            ),
            const SizedBox(height: AppSizes.xxl),
          ],
        ),
      ),
    );
  }
}