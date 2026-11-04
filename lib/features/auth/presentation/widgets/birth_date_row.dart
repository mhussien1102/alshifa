import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';

class BirthDateRow extends StatelessWidget {
  final TextEditingController birthDateController;
  final TextEditingController ageController;
  final VoidCallback onPickDate;

  const BirthDateRow({
    super.key,
    required this.birthDateController,
    required this.ageController,
    required this.onPickDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: CustomTextField(
            label: 'تاريخ الميلاد',
            hint: 'اختر التاريخ',
            controller: birthDateController,
            readOnly: true,
            compact: true,
            prefixIcon: LucideIcons.calendar,
            onTap: onPickDate,
            validator: (value) => Validators.required(value, 'تاريخ الميلاد'),
          ),
        ),
        const SizedBox(width: AppSizes.sm),
        Expanded(
          flex: 5,
          child: CustomTextField(
            label: 'السن',
            hint: '—',
            controller: ageController,
            readOnly: true,
            compact: true,
            fillColor: AppColors.disabledFill,
          ),
        ),
      ],
    );
  }
}