import 'package:flutter/widgets.dart';

import '../widgets/flying_item.dart';

void flyToTarget({
  required BuildContext context,
  required Rect from,
  required Rect to,
  required Widget child,
  required VoidCallback onLanded,
}) {
  final overlay = Overlay.of(context, rootOverlay: true);
  late final OverlayEntry entry;
  entry = OverlayEntry(
    builder: (_) => FlyingItem(
      from: from,
      to: to,
      child: child,
      onCompleted: () {
        entry.remove();
        entry.dispose();
        onLanded();
      },
    ),
  );
  overlay.insert(entry);
}