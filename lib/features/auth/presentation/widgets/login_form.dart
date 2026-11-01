import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../utils/login_actions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          CustomTextField(
            label: 'البريد الإلكتروني',
            hint: 'name@example.com',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.email,
          ),
          const SizedBox(height: AppSizes.lg),
          CustomTextField(
            label: 'كلمة السر',
            hint: '••••••••',
            controller: _passwordController,
            isPassword: true,
            textInputAction: TextInputAction.done,
            validator: (value) => Validators.required(value, 'كلمة السر'),
            onSubmitted: (_) => submitLogin(context, _formKey),
          ),
          const SizedBox(height: AppSizes.md),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () => goToForgotPassword(context),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('نسيت كلمة السر؟'),
            ),
          ),
          const SizedBox(height: AppSizes.xl),
          CustomButton(
            text: 'تسجيل الدخول',
            onPressed: () => submitLogin(context, _formKey),
          ),
        ],
      ),
    );
  }
}