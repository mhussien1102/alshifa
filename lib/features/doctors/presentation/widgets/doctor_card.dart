import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/initial_avatar.dart';
import '../../domain/entities/doctor.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onBook;

  const DoctorCard({super.key, required this.doctor, required this.onBook});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          InitialAvatar(name: doctor.name),
          const SizedBox(width: AppSizes.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(fontSize: 17),
                ),
                const SizedBox(height: AppSizes.xs / 2),
                Text(
                  doctor.specialty,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
                const SizedBox(height: AppSizes.sm - 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Icon(
                        LucideIcons.clock,
                        size: 16,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: AppSizes.xs + 2),
                    Expanded(
                      child: Text(
                        'أقرب موعد: ${doctor.nextSlot}',
                        style: textTheme.labelLarge?.copyWith(
                          fontSize: 13,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.md),
          SizedBox(
            width: 66,
            child: CustomButton(
              text: 'احجز',
              height: AppSizes.circleButton,
              onPressed: onBook,
            ),
          ),
        ],
      ),
    );
  }
}