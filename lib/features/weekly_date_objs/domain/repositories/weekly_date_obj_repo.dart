import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRepoProtocol {
  List<WeeklyDateObj> fetchWeeklyDateObjs();
  void deleteWeeklyDateObjs();
}

class WeeklyDateObjRepo implements WeeklyDateObjRepoProtocol {
  @override
  void deleteWeeklyDateObjs() {
    // TODO: implement deleteWeeklyDateObjs
  }

  @override
  List<WeeklyDateObj> fetchWeeklyDateObjs() {
    // TODO: implement fetchWeeklyDateObjs
    throw UnimplementedError();
  }
}
