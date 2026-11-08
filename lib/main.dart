import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/pharmacy/presentation/cubit/cart_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'مستشفى الشفاء',
        theme: AppTheme.light,
        routerConfig: AppRouter.router,
        builder: (context, child) =>
            Directionality(textDirection: TextDirection.rtl, child: child!),
      ),
    );
  }
}