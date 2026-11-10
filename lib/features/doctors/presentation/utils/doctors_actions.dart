import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../domain/entities/doctor.dart';

void openBooking(BuildContext context, Doctor doctor) {
  context.push(AppRoutes.bookAppointment, extra: doctor);
}