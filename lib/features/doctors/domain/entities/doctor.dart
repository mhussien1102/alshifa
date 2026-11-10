import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String specialty;
  final String category;
  final String nextSlot;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.category,
    required this.nextSlot,
  });

  @override
  List<Object?> get props => [id, name, specialty, category, nextSlot];
}