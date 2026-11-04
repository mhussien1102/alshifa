import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/data_helper.dart';
import '../../../../core/utils/formaters.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../utils/register_actions.dart';
import 'birth_date_row.dart';
import 'gender_selector.dart';
import 'register_footer.dart';
import 'register_header.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _ageController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  DateTime? _birthDate;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _ageController.dispose();
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
                    const SizedBox(height: AppSizes.xxxl),
                    const RegisterHeader(),
                    const SizedBox(height: AppSizes.lg),
                    CustomTextField(
                      label: 'الاسم',
                      hint: 'اسمك بالكامل',
                      controller: _nameController,
                      compact: true,
                      keyboardType: TextInputType.name,
                      validator: (value) => Validators.required(value, 'الاسم'),
                    ),
                    const SizedBox(height: AppSizes.md),
                    CustomTextField(
                      label: 'البريد الإلكتروني',
                      hint: 'name@example.com',
                      controller: _emailController,
                      compact: true,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                    ),
                    const SizedBox(height: AppSizes.md),
                    GenderSelector(
                      validator: (value) => value == null ? 'اختر النوع' : null,
                    ),
                    const SizedBox(height: AppSizes.md),
                    BirthDateRow(
                      birthDateController: _birthDateController,
                      ageController: _ageController,
                      onPickDate: () => pickBirthDate(
                        context,
                        initialDate: _birthDate,
                        onPicked: (date) => setState(() {
                          _birthDate = date;
                          _birthDateController.text = Formatters.date(date);
                          _ageController.text = Formatters.age(
                            DateHelpers.calculateAge(date),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: AppSizes.md),
                    CustomTextField(
                      label: 'كلمة السر',
                      hint: '••••••••',
                      controller: _passwordController,
                      compact: true,
                      isPassword: true,
                      validator: Validators.password,
                    ),
                    const SizedBox(height: AppSizes.md),
                    CustomTextField(
                      label: 'تأكيد كلمة السر',
                      hint: '••••••••',
                      controller: _confirmPasswordController,
                      compact: true,
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      validator: (value) => Validators.confirmPassword(
                        value,
                        _passwordController.text,
                      ),
                    ),
                    const SizedBox(height: AppSizes.xl),
                  ],
                ),
              ),
            ),
            CustomButton(
              text: 'إنشاء الحساب',
              onPressed: () => submitRegister(
                context,
                _formKey,
                _emailController.text.trim(),
              ),
            ),
            const SizedBox(height: AppSizes.lg),
            const RegisterFooter(),
            const SizedBox(height: AppSizes.xxl),
          ],
        ),
      ),
    );
  }
}