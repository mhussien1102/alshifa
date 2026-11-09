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

  static String? cardNumber(String? value) {
    final digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return 'رقم البطاقة مطلوب';
    if (digits.length != 16) return 'رقم البطاقة يجب أن يتكون من ١٦ رقمًا';
    return null;
  }

  static String? expiry(String? value) {
    final digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return 'تاريخ الانتهاء مطلوب';
    if (digits.length != 4) return 'أدخل التاريخ بصيغة MM / YY';
    final month = int.parse(digits.substring(0, 2));
    final year = 2000 + int.parse(digits.substring(2));
    if (month < 1 || month > 12) return 'شهر غير صحيح';
    final endOfMonth = DateTime(year, month + 1);
    if (!endOfMonth.isAfter(DateTime.now())) return 'البطاقة منتهية';
    return null;
  }

  static String? cvv(String? value) {
    final digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return 'رمز الأمان مطلوب';
    if (digits.length < 3) return 'رمز الأمان غير صحيح';
    return null;
  }

  static String? phone(String? value) {
    final digits = (value ?? '').replaceAll(RegExp(r'\s'), '');
    if (digits.isEmpty) return 'رقم الموبايل مطلوب';
    if (!RegExp(r'^01[0-9]{9}$').hasMatch(digits)) {
      return 'أدخل رقم موبايل صحيح مكوّن من ١١ رقمًا';
    }
    return null;
  }
}