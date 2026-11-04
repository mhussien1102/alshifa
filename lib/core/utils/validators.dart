abstract final class Validators {
  static String? required(String? value, [String field = 'هذا الحقل']) {
    if (value == null || value.trim().isEmpty) return '$field مطلوب';
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    final isValid = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(value.trim());
    return isValid ? null : 'بريد إلكتروني غير صحيح';
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'كلمة السر مطلوبة';
    if (value.length < 8) return 'كلمة السر يجب ألا تقل عن ٨ أحرف';
    if (!RegExp(r'\d').hasMatch(value)) return 'يجب أن تحتوي على أرقام';
    return null;
  }

  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) return 'تأكيد كلمة السر مطلوب';
    if (value != original) return 'كلمتا السر غير متطابقتين';
    return null;
  }
}