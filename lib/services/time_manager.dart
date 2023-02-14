// ignore_for_file: depend_on_referenced_packages

// calc: DateTime -> String
// e.g. 2022-12-13-00:00 -> '2022-12-13'
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';
import 'package:collection/collection.dart';

String calcFullDate(DateTime dateTime) {
  return dateTime.toString().substring(0, 10);
}

// get current week Monday
DateTime getCurrentWeekMonday(DateTime date) {
  return DateTime(date.year, date.month, date.day - (date.weekday - 1) % 7);
}

// get current fullDate
String getCurrentFullDate() {
  DateTime today = DateTime.now();
  return calcFullDate(today);
}

// get current week-dates (x7)
List<DateTime> getWeeklyDates() {
  List<DateTime> weekDates = [];
  var now = DateTime.now();
  var mondayDateTime = getCurrentWeekMonday(now);

  for (var i = 0; i < 7; i++) {
    DateTime date;
    if (i == 0) {
      // get monday-date
      date = mondayDateTime;
    } else {
      // get rest-date
      date = DateTime(
        mondayDateTime.year,
        mondayDateTime.month,
        mondayDateTime.day + i,
      );
    }
    weekDates.add(date);
  }

  return weekDates;
}

// Compare current-date with fullDates of WeeklyDateObjs
/// Check if weeklyDateObjs is out of date
bool isWeeklyDateObjsOutOfDate(List<WeeklyDateObj> weeklyDateObjs) {
  var currFullDate = getCurrentFullDate();
  var existObj =
      weeklyDateObjs.firstWhereOrNull((obj) => obj.fullDate == currFullDate);

  return existObj != null ? false : true;
}
