import 'package:flutter_not_my_desk/models/Floor.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';
import 'package:flutter_not_my_desk/services/seat_manager.dart';
import 'package:flutter_not_my_desk/services/time_manager.dart';

String calcFloorNameEn(int floorId) {
  var floorName = "";
  switch (floorId) {
    case 3:
      floorName = "3rd Floor";
      break;
    case 4:
      floorName = "4th Floor";
      break;
    case 5:
      floorName = "5th Floor";
      break;
    default:
      break;
  }
  return floorName;
}

List<WeeklyDateObj> generateWeeklyDateObjs(List<int> floorIDs) {
  List<WeeklyDateObj> weeklyDateObjs = [];

  // current weekly-dates (x7)
  var weeklyDates = getWeeklyDates();
  // iterate 7 dates to generate weekly-date-objs
  for (var weeklyDate in weeklyDates) {
    var fullDate = calcFullDate(weeklyDate);

    // TODO: generate floors (x3) for each day
    List<Floor> dailyFloors = [];
    for (var floorId in floorIDs) {
      var floorName = calcFloorNameEn(floorId);
      var oneFloorSeats = generateSeats(floorId, floorName, fullDate);
      var oneFloor = Floor(floorId, floorName, fullDate, oneFloorSeats);
      dailyFloors.add(oneFloor);
    }

    // generate weekly-obj
    var weeklyDateObj = WeeklyDateObj(
      fullDate,
      dailyFloors,
    );
    weeklyDateObjs.add(weeklyDateObj);
  }

  return weeklyDateObjs;
}
