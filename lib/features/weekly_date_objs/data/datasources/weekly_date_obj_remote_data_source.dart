import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRemoteDataSourceProtocol {
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs);
  Future<List<WeeklyDateObj>> downloadObjs();
  Future<void> deleteObjs();
  void updateObjBy(String objId, Map<String, dynamic> updatedObj);
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

  // Fetch weeklyDateObjs from Firebase
  @override
  Future<List<WeeklyDateObj>> downloadObjs() async {
    final snapshot = await _db.collection("weeklyDateObjs").get();
    var weeklyDateObjs = snapshot.docs
        .map<WeeklyDateObj>((e) => WeeklyDateObj.fromSnapshot(e))
        .toList();
    return weeklyDateObjs;
  }

  // Delete all weeklyDateObjs from Firebase
  @override
  Future<void> deleteObjs() async {
    // Get collection (a list of docs)
    final snapshots = await _db.collection("weeklyDateObjs").get();
    // Delete the docs one by one
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  @override
  void updateObjBy(String id, Map<String, dynamic> updatedObj) {
    _db.collection("weeklyDateObjs").doc(id).update(updatedObj);
  }
}
