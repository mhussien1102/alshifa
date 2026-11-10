import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_chip.dart';

class DoctorCategoryChips extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelected;

  const DoctorCategoryChips({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.circleButton,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: AppSizes.sm),
        itemBuilder: (context, index) {
          final category = categories[index];
          return AppChip(
            label: category,
            selected: category == selected,
            onTap: () => onSelected(category),
          );
        },
      ),
    );
  }
}