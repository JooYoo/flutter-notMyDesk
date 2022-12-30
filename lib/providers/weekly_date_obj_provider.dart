import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';
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
  set selectedFloor(Floor val) {
    _selectedFloor = val;
    notifyListeners();
  }
}
