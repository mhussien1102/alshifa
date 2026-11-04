import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/formaters.dart';
import '../utils/calendar_utils.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime month;
  final DateTime? selected;
  final ValueChanged<DateTime> onSelect;

  const CalendarGrid({
    super.key,
    required this.month,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cells = CalendarUtils.monthCells(month.year, month.month);

    return Column(
      children: [
        Row(
          children: [
            for (final day in Formatters.weekdaysShort)
              Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: textTheme.bodyMedium?.copyWith(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSizes.sm),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cells.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisExtent: AppSizes.calendarDayHeight,
          ),
          itemBuilder: (context, index) {
            final date = cells[index];
            if (date == null) return const SizedBox.shrink();
            final isSelected =
                selected != null && CalendarUtils.isSameDay(date, selected!);
            final isEnabled = !CalendarUtils.isFuture(date);

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: isEnabled ? () => onSelect(date) : null,
              child: Container(
                margin: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : null,
                  borderRadius: BorderRadius.circular(AppSizes.radiusPill),
                ),
                child: Text(
                  Formatters.digits(date.day),
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                    color: isSelected
                        ? Colors.white
                        : isEnabled
                        ? AppColors.textPrimary
                        : AppColors.textSecondary.withValues(alpha: 0.4),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}