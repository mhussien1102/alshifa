import 'package:flutter/material.dart';

import '../widgets/pharmacy_view.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(bottom: false, child: PharmacyView()),
    );
  }
}