import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRemoteDataSourceProtocol {
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs);
  Future<List<WeeklyDateObj>> downloadObjs();
  void deleteObjs();
  void updateObjBy(String id);
}

class WeeklyDateObjRemoteDataSource
    implements WeeklyDateObjRemoteDataSourceProtocol {
  // Firestore instance
  final _db = FirebaseFirestore.instance;

  // Create weeklyDateObjs into Firestore
  @override
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs) {
    for (var obj in weeklyDateObjs) {
      _db.collection("weeklyDateObjs").add(obj.toJson());
    }
  }

  @override
  Future<List<WeeklyDateObj>> downloadObjs() async {
    final snapshot = await _db.collection("weeklyDateObjs").get();
    var weeklyDateObjs = snapshot.docs
        .map<WeeklyDateObj>((e) => WeeklyDateObj.fromSnapshot(e))
        .toList();
    return weeklyDateObjs;
  }

  @override
  void deleteObjs() {
    // TODO: implement deleteObjs
    throw UnimplementedError();
  }

  @override
  void updateObjBy(String id) {
    // TODO: implement updateObjBy
    throw UnimplementedError();
  }
}
