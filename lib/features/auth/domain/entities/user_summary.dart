import 'package:equatable/equatable.dart';

class UserSummary extends Equatable {
  final String name;
  final String fileNumber;

  const UserSummary({required this.name, required this.fileNumber});

  @override
  List<Object?> get props => [name, fileNumber];
}