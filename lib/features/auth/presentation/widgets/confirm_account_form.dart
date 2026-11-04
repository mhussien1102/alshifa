import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_back_button.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/otp_input.dart';
import '../../../../core/widgets/text_link_row.dart';
import '../utils/otp_actions.dart';
import 'auth_icon_header.dart';
import 'email_info_card.dart';

class ConfirmAccountForm extends StatefulWidget {
  final String email;

  const ConfirmAccountForm({super.key, required this.email});

  @override
  State<ConfirmAccountForm> createState() => _ConfirmAccountFormState();
}

class _ConfirmAccountFormState extends State<ConfirmAccountForm> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    icon: LucideIcons.mail,
                    title: 'تأكيد الحساب',
                    subtitle: 'أدخل رمز التحقق المكوّن من ٦ أرقام.',
                  ),
                  const SizedBox(height: AppSizes.xxl),
                  EmailInfoCard(email: widget.email),
                  const SizedBox(height: AppSizes.md),
                  CustomButton(
                    text: 'إرسال الرمز',
                    type: CustomButtonType.outlined,
                    height: AppSizes.secondaryButtonHeight,
                    onPressed: () => sendCode(context),
                  ),
                  const SizedBox(height: AppSizes.xxl),
                  OtpInput(label: 'رمز التحقق', controller: _otpController),
                  const SizedBox(height: AppSizes.xl),
                  TextLinkRow(
                    text: 'لم يصلك الرمز؟',
                    linkText: 'إعادة الإرسال',
                    onPressed: () => sendCode(context),
                  ),
                  const SizedBox(height: AppSizes.xl),
                ],
              ),
            ),
          ),
          CustomButton(
            text: 'تأكيد',
            onPressed: () => submitConfirmAccount(context, _otpController),
          ),
          const SizedBox(height: AppSizes.xxl),
        ],
      ),
    );
  }
}