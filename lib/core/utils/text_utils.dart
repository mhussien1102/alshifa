abstract final class TextUtils {
  static String initialOf(String name) {
    final cleaned = name.trim().replaceFirst(RegExp(r'^د\.\s*|^د\s+'), '');
    if (cleaned.isEmpty) return '';
    return String.fromCharCode(cleaned.runes.first);
  }
}