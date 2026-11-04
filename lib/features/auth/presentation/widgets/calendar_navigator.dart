import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/formaters.dart';

class CalendarNavigator extends StatelessWidget {
  final DateTime month;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final VoidCallback onPreviousYear;
  final VoidCallback onNextYear;

  const CalendarNavigator({
    super.key,
    required this.month,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onPreviousYear,
    required this.onNextYear,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: _Stepper(
            label: Formatters.months[month.month - 1],
            onPrevious: onPreviousMonth,
            onNext: onNextMonth,
          ),
        ),
        const SizedBox(width: AppSizes.lg),
        Expanded(
          flex: 8,
          child: _Stepper(
            label: Formatters.digits(month.year),
            onPrevious: onPreviousYear,
            onNext: onNextYear,
          ),
        ),
      ],
    );
  }
}

class _Stepper extends StatelessWidget {
  final String label;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _Stepper({
    required this.label,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ArrowButton(icon: LucideIcons.chevronRight, onPressed: onPrevious),
        Expanded(
          child: Center(
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 17),
            ),
          ),
        ),
        _ArrowButton(icon: LucideIcons.chevronLeft, onPressed: onNext),
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ArrowButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusField),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: AppSizes.arrowButton,
          height: AppSizes.arrowButton,
          child: Icon(icon, size: 20, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}