import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/sheet_header.dart';
import '../utils/calendar_utils.dart';
import 'birth_date_summary.dart';
import 'calendar_grid.dart';
import 'calendar_navigator.dart';

class BirthDateSheet extends StatefulWidget {
  final DateTime? initialDate;

  const BirthDateSheet({super.key, this.initialDate});

  @override
  State<BirthDateSheet> createState() => _BirthDateSheetState();
}

class _BirthDateSheetState extends State<BirthDateSheet> {
  late DateTime? _selected = widget.initialDate;
  late DateTime _month = DateTime(
    widget.initialDate?.year ?? 2000,
    widget.initialDate?.month ?? 1,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSizes.screenPadding,
          AppSizes.xl,
          AppSizes.screenPadding,
          AppSizes.xxl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetHeader(
              title: 'تاريخ الميلاد',
              onClose: () => Navigator.of(context).pop(),
            ),
            const SizedBox(height: AppSizes.lg),
            BirthDateSummary(date: _selected),
            const SizedBox(height: AppSizes.lg),
            CalendarNavigator(
              month: _month,
              onPreviousMonth: () => setState(
                    () => _month = CalendarUtils.shiftMonth(_month, -1),
              ),
              onNextMonth: () => setState(
                    () => _month = CalendarUtils.shiftMonth(_month, 1),
              ),
              onPreviousYear: () => setState(
                    () => _month = CalendarUtils.shiftYear(_month, -1),
              ),
              onNextYear: () => setState(
                    () => _month = CalendarUtils.shiftYear(_month, 1),
              ),
            ),
            const SizedBox(height: AppSizes.md),
            CalendarGrid(
              month: _month,
              selected: _selected,
              onSelect: (date) => setState(() => _selected = date),
            ),
            const SizedBox(height: AppSizes.lg),
            CustomButton(
              text: 'تأكيد',
              onPressed: _selected == null
                  ? null
                  : () => Navigator.of(context).pop(_selected),
            ),
          ],
        ),
      ),
    );
  }
}