import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/selectable_option.dart';

class GenderSelector extends FormField<String> {
  GenderSelector({super.key, super.validator, super.onSaved})
      : super(
    builder: (state) {
      final textTheme = Theme.of(state.context).textTheme;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('النوع', style: textTheme.labelLarge),
          const SizedBox(height: AppSizes.sm),
          Row(
            children: [
              Expanded(
                child: SelectableOption(
                  label: 'ذكر',
                  selected: state.value == 'male',
                  onTap: () => state.didChange('male'),
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: SelectableOption(
                  label: 'أنثى',
                  selected: state.value == 'female',
                  onTap: () => state.didChange('female'),
                ),
              ),
            ],
          ),
          if (state.hasError)
            Padding(
              padding: const EdgeInsets.only(top: AppSizes.xs),
              child: Text(
                state.errorText!,
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.error,
                ),
              ),
            ),
        ],
      );
    },
  );
}