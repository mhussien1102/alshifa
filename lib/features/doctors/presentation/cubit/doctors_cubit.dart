import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/doctors_sample_data.dart';
import 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit()
      : super(
    const DoctorsState(
      doctors: sampleDoctors,
      category: doctorCategoryAll,
    ),
  );

  void search(String query) {
    emit(_filtered(query: query, category: state.category));
  }

  void selectCategory(String category) {
    emit(_filtered(query: state.query, category: category));
  }

  DoctorsState _filtered({required String query, required String category}) {
    final normalized = query.trim();
    final doctors = sampleDoctors.where((doctor) {
      final matchesCategory =
          category == doctorCategoryAll || doctor.category == category;
      final matchesQuery = normalized.isEmpty ||
          doctor.name.contains(normalized) ||
          doctor.specialty.contains(normalized);
      return matchesCategory && matchesQuery;
    }).toList();
    return DoctorsState(doctors: doctors, query: query, category: category);
  }
}