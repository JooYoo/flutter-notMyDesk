import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';
import 'package:flutter_not_my_desk/services/time_manager.dart';
import 'package:flutter_not_my_desk/services/weekly_floor_manager.dart';

final List<WeeklyDateObj> defaultWeeklyDateObjs =
    generateWeeklyDateObjs([3, 4, 5]);
final String defaultCurrentFullDate = getCurrentFullDate();

class WeeklyDateObjProvider extends ChangeNotifier {
  // weekly-date-objs (x7) for the current week
  // defaul: local generated data (FIXME: add online storage)
  final List<WeeklyDateObj> _weeklyDateObjs = generateWeeklyDateObjs([3, 4, 5]);
  List<WeeklyDateObj> get weeklyDateObjs => _weeklyDateObjs;

  // selected-fullDate
  // default: today
  String _selectedFullDate = getCurrentFullDate();
  String get selectedFullDate => _selectedFullDate;
  set selectedFullDate(String val) {
    _selectedFullDate = val;
    notifyListeners();
  }

  // selected-floor
  // default weeklyDateObjs: generated local data
  // default currentFullDate: today
  Floor _selectedFloor = getSelectedDateFloors(
    defaultWeeklyDateObjs,
    defaultCurrentFullDate,
  ).last;
  Floor get selectedFloor => _selectedFloor;

  /* --------------------------------- methods -------------------------------- */
  // set current floor by selected-date, floor-id
  void setSelectedFloorBy(
    List<WeeklyDateObj> weeklyDateObjs,
    String selectedFullDate,
    int floorId,
  ) {
    // set new selected-full-date
    _selectedFullDate = selectedFullDate;
    // set selected-floor by weekly-date-objs and full-date
    _selectedFloor = getSelectedDateIdFloor(
      weeklyDateObjs,
      selectedFullDate,
      floorId,
    );
    notifyListeners();
  }

  // set seat by: selected-floor, selected-seat, occupiedBy
  void setOccupyBy(Seat selectedSeat, String newOccupiedBy) {
    // find target seat from
    var seat = _selectedFloor.seats!
        .firstWhere((seat) => seat.deskNr == selectedSeat.deskNr);
    // set occupy
    seat.occupied = newOccupiedBy;

    notifyListeners();
  }
}
