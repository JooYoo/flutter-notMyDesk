import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/domain/usecases/get_weekly_date_objs_uc.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';
import 'package:flutter_not_my_desk/repository/weeklyDateObj_repository.dart';
import 'package:flutter_not_my_desk/services/time_manager.dart';
import 'package:flutter_not_my_desk/services/weekly_floor_manager.dart';

final List<WeeklyDateObj> defaultWeeklyDateObjs =
    generateWeeklyDateObjs([3, 4, 5]);
final String defaultCurrentFullDate = getCurrentFullDate();
var weeklyDateObjRepository = WeeklyDateObjRepository();

class WeeklyDateObjProvider extends ChangeNotifier {
  // Dependency Injection
  // FIXME: It causes the instance of Provider has a parameter:
  // TODO: Try to use get_it to do Dependecy Injection
  // final GetWeeklyDateObjsUcProtocol getWeeklyDateObjsUC;
  // WeeklyDateObjProvider(this.getWeeklyDateObjsUC);

  // weekly-date-objs (x7) for the current week
  // defaul: local generated data
  // When app start
  // - fetch data from Firestore
  // - set the fetched data to `_weeklyDateObjs` to replace the generated data
  List<WeeklyDateObj> _weeklyDateObjs = defaultWeeklyDateObjs;
  List<WeeklyDateObj> get weeklyDateObjs => _weeklyDateObjs;
  set weeklyDateObjs(List<WeeklyDateObj> val) {
    _weeklyDateObjs = val;
    notifyListeners();
  }

  // selected-fullDate
  // default: today
  String _selectedFullDate = getCurrentFullDate();
  String get selectedFullDate => _selectedFullDate;
  set selectedFullDate(String val) {
    _selectedFullDate = val;
    notifyListeners();
  }

  // selected-floor
  // FIXME: default weeklyDateObjs: generated local data
  // default currentFullDate: today
  Floor _selectedFloor = getSelectedDateFloors(
    defaultWeeklyDateObjs,
    defaultCurrentFullDate,
  ).last;
  Floor get selectedFloor => _selectedFloor;

  /* --------------------------------- methods -------------------------------- */
  // fetch data from Firebase set to store
  /// Be used in `main`
  fetchDataSetStore() async {
    // var test = await getWeeklyDateObjsUC();
    // fetch data from Firebase
    var data = await weeklyDateObjRepository.getWeeklyDateObjs();

    // set feched data into center-store
    _weeklyDateObjs = data;

    // set selectedFloor based on fetched data when init
    _selectedFloor =
        getSelectedDateFloors(_weeklyDateObjs, defaultCurrentFullDate).last;

    // responsive
    notifyListeners();

    // TODO: no need to return anything because data is already set to _weeklyDateObjs
    // return data for FutureBuilder in `main.dart`
    return _weeklyDateObjs;
  }

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
  Future<void> setOccupyBy(Seat selectedSeat, String newOccupiedBy) async {
    // find target seat from
    var seat = _selectedFloor.seats
        .firstWhere((seat) => seat.deskNr == selectedSeat.deskNr);
    // set occupy
    seat.occupiedBy = newOccupiedBy;
    // update date to Firebase
    await weeklyDateObjRepository.fbUpdateObj(_weeklyDateObjs, seat);

    notifyListeners();
  }
}
