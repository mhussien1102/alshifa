import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_search_bar.dart';
import '../../data/datasources/doctors_sample_data.dart';
import '../cubit/doctors_cubit.dart';
import '../cubit/doctors_state.dart';
import '../utils/doctors_actions.dart';
import 'doctor_card.dart';
import 'doctor_category_chips.dart';
import 'doctors_empty_state.dart';
import 'doctors_header.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.screenPadding,
              ),
              child: Column(
                children: [
                  const SizedBox(height: AppSizes.xxl),
                  const DoctorsHeader(),
                  const SizedBox(height: AppSizes.md),
                  AppSearchBar(
                    hint: 'اسم الطبيب أو التخصص',
                    onChanged: context.read<DoctorsCubit>().search,
                  ),
                  const SizedBox(height: AppSizes.lg),
                ],
              ),
            ),
            DoctorCategoryChips(
              categories: doctorCategories,
              selected: state.category,
              onSelected: context.read<DoctorsCubit>().selectCategory,
            ),
            const SizedBox(height: AppSizes.lg),
            Expanded(
              child: state.doctors.isEmpty
                  ? const DoctorsEmptyState()
                  : ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.screenPadding,
                  0,
                  AppSizes.screenPadding,
                  AppSizes.lg,
                ),
                itemCount: state.doctors.length,
                separatorBuilder: (context, index) =>
                const SizedBox(height: AppSizes.md),
                itemBuilder: (context, index) {
                  final doctor = state.doctors[index];
                  return DoctorCard(
                    key: ValueKey(doctor.id),
                    doctor: doctor,
                    onBook: () => openBooking(context, doctor),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}