import 'package:equatable/equatable.dart';

import '../../domain/entities/doctor.dart';

class DoctorsState extends Equatable {
  final List<Doctor> doctors;
  final String query;
  final String category;

  const DoctorsState({
    required this.doctors,
    this.query = '',
    required this.category,
  });

  @override
  List<Object?> get props => [doctors, query, category];
}