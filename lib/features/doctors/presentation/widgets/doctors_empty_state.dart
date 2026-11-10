import 'package:flutter/material.dart';

class DoctorsEmptyState extends StatelessWidget {
  const DoctorsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'لا يوجد أطباء مطابقون لبحثك',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),
      ),
    );
  }
}