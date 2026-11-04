abstract final class DateHelpers {
  static int calculateAge(DateTime birthDate, [DateTime? now]) {
    final today = now ?? DateTime.now();
    var age = today.year - birthDate.year;
    final hadBirthday = today.month > birthDate.month ||
        (today.month == birthDate.month && today.day >= birthDate.day);
    if (!hadBirthday) age--;
    return age;
  }
}