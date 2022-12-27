// calc: DateTime -> String
// e.g. 2022-12-13-00:00 -> '2022-12-13'
String calcFullDate(DateTime dateTime) {
  return dateTime.toString().substring(0, 10);
}

// get current week Monday
DateTime getCurrentWeekMonday(DateTime date) {
  return DateTime(date.year, date.month, date.day - (date.weekday - 1) % 7);
}

// TODO: get current fullDate

// get current week-dates (x7)
List<DateTime> getWeeklyDates() {
  List<DateTime> weekDates = [];
  var now = DateTime.now();

  for (var i = 0; i < 7; i++) {
    DateTime date;
    if (i == 0) {
      // get monday-date
      date = getCurrentWeekMonday(now);
    } else {
      // get rest-date
      date = DateTime(now.year, now.month, now.day + i);
    }
    weekDates.add(date);
  }

  return weekDates;
}
