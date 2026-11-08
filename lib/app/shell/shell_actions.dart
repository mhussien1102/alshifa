import 'package:go_router/go_router.dart';

void switchTab(StatefulNavigationShell shell, int index) {
  shell.goBranch(index, initialLocation: index == shell.currentIndex);
}