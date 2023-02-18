import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRemoteDataSourceProtocol {
  void createObjs(List<WeeklyDateObj> weeklyDateObjs);
  List<WeeklyDateObj> retrieveObjs();
  void deleteObjs();
  void updateObjBy(String id);
}

class WeeklyDateObjRemoteDataSource
    implements WeeklyDateObjRemoteDataSourceProtocol {
  // Firestore instance
  final _db = FirebaseFirestore.instance;

  // Create weeklyDateObjs into Firestore
  @override
  void createObjs(List<WeeklyDateObj> weeklyDateObjs) {
    for (var obj in weeklyDateObjs) {
      _db.collection("weeklyDateObjs").add(obj.toJson());
    }
  }

  @override
  List<WeeklyDateObj> retrieveObjs() {
    // TODO: implement retrieveObjs
    throw UnimplementedError();
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
