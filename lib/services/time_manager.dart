// get current week Monday
DateTime getCurrentWeekMonday(DateTime date) {
  return DateTime(date.year, date.month, date.day - (date.weekday - 1) % 7);
}
