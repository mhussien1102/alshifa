import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/doctors_cubit.dart';
import '../widgets/doctors_view.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DoctorsCubit(),
      child: const Scaffold(
        body: SafeArea(bottom: false, child: DoctorsView()),
      ),
    );
  }
}