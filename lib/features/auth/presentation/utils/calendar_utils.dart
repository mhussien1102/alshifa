abstract final class CalendarUtils {
  static final DateTime _minMonth = DateTime(1900, 1);

  static List<DateTime?> monthCells(int year, int month) {
    final first = DateTime(year, month, 1);
    final offset = (first.weekday + 1) % 7;
    final daysInMonth = DateTime(year, month + 1, 0).day;
    return [
      ...List<DateTime?>.filled(offset, null),
      for (var day = 1; day <= daysInMonth; day++) DateTime(year, month, day),
    ];
  }

  static DateTime clampMonth(DateTime month) {
    final now = DateTime.now();
    final maxMonth = DateTime(now.year, now.month);
    if (month.isBefore(_minMonth)) return _minMonth;
    if (month.isAfter(maxMonth)) return maxMonth;
    return DateTime(month.year, month.month);
  }

  static DateTime shiftMonth(DateTime month, int delta) {
    return clampMonth(DateTime(month.year, month.month + delta));
  }

  static DateTime shiftYear(DateTime month, int delta) {
    return clampMonth(DateTime(month.year + delta, month.month));
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static bool isFuture(DateTime date) {
    final now = DateTime.now();
    return date.isAfter(DateTime(now.year, now.month, now.day));
  }
}