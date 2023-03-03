import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRemoteDataSourceProtocol {
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs);
  Future<List<WeeklyDateObj>> fetchObjs();
  Future<void> deleteObjs();
  Future<Map<String, dynamic>?> fetchCollectionBy(String id);
  void updateCollectionBy(String id, Map<String, dynamic> updatedCollection);
}

class WeeklyDateObjRemoteDataSource
    implements WeeklyDateObjRemoteDataSourceProtocol {
  // Firestore instance
  final _db = FirebaseFirestore.instance;
  // TODO: add collection name as a variable

  // Create weeklyDateObjs into Firestore
  @override
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs) {
    for (var obj in weeklyDateObjs) {
      _db.collection("weeklyDateObjs").add(obj.toJson());
    }
  }

  // Fetch weeklyDateObjs from Firebase
  @override
  Future<List<WeeklyDateObj>> fetchObjs() async {
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
  Future<Map<String, dynamic>?> fetchCollectionBy(String id) async {
    final value = await _db.collection("weeklyDateObjs").doc(id).get();
    return value.data();
  }

  @override
  void updateCollectionBy(String id, Map<String, dynamic> updatedCollection) {
    _db.collection("weeklyDateObjs").doc(id).update(updatedCollection);
  }
}
