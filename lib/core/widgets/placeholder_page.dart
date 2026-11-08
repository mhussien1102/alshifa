import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_size.dart';
import 'app_back_button.dart';

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (context.canPop())
              const Padding(
                padding: EdgeInsets.all(AppSizes.authPadding),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: AppBackButton(),
                ),
              ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}