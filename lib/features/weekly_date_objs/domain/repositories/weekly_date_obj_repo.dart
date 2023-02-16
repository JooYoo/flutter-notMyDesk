import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRepo {
  List<WeeklyDateObj> fetchWeeklyDateObjs();
  void deleteWeeklyDateObjs();
}

class WeeklyDateObjRepoImpl implements WeeklyDateObjRepo {
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
