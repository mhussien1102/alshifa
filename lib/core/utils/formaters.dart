abstract final class Formatters {
  static const _arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  static const months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  static const weekdaysShort = ['س', 'ح', 'ن', 'ث', 'ر', 'خ', 'ج'];

  static String digits(Object value) {
    return value.toString().replaceAllMapped(
      RegExp(r'\d'),
          (match) => _arabicDigits[int.parse(match[0]!)],
    );
  }

  static String date(DateTime date) {
    return '${digits(date.day)} ${months[date.month - 1]} ${digits(date.year)}';
  }

  static String age(int years) => '${digits(years)} سنة';

  static String itemsCount(int count) {
    if (count == 1) return 'منتج واحد';
    if (count == 2) return 'منتجان';
    if (count <= 10) return '${digits(count)} منتجات';
    return '${digits(count)} منتجًا';
  }

  static String price(num value) {
    final text = value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
    return '${digits(text)} ج.م';
  }
}