import 'package:go_router/go_router.dart';

import 'shell_keys.dart';

void switchTab(StatefulNavigationShell shell, int index) {
  shell.goBranch(index, initialLocation: index == shell.currentIndex);
}

void openDrawer() {
  mainScaffoldKey.currentState?.openEndDrawer();
}

void closeDrawer() {
  mainScaffoldKey.currentState?.closeEndDrawer();
}