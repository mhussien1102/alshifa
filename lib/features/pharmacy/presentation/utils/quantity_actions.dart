Map<String, int> incrementQuantity(Map<String, int> quantities, String id) {
  return {...quantities, id: (quantities[id] ?? 0) + 1};
}

Map<String, int> decrementQuantity(Map<String, int> quantities, String id) {
  final current = quantities[id] ?? 0;
  final updated = {...quantities};
  if (current <= 1) {
    updated.remove(id);
  } else {
    updated[id] = current - 1;
  }
  return updated;
}

int totalQuantity(Map<String, int> quantities) {
  return quantities.values.fold(0, (sum, value) => sum + value);
}

int visibleCartCount(Map<String, int> quantities, int pending) {
  final count = totalQuantity(quantities) - pending;
  return count < 0 ? 0 : count;
}