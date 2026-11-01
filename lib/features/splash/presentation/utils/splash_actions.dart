import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';

void goToLogin(BuildContext context) {
  context.go(AppRoutes.login);
}