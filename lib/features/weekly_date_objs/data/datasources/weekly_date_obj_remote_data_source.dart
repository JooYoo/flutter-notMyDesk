import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRemoteDataSourceProtocol {
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs);
  Future<List<WeeklyDateObj>> fetchObjs();
  Future<void> deleteObjs();
  Future<Map<String, dynamic>?> fetchCollectionBy(String? id);
  void updateCollectionBy(String? id, Map<String, dynamic> updatedCollection);
}

class WeeklyDateObjRemoteDataSource
    implements WeeklyDateObjRemoteDataSourceProtocol {
  // Firestore instance
  final _db = FirebaseFirestore.instance;
  final _collectionPath = "weeklyDateObjs";

  // Create weeklyDateObjs into Firestore
  @override
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs) {
    for (var obj in weeklyDateObjs) {
      _db.collection(_collectionPath).add(obj.toJson());
    }
  }

  // Fetch weeklyDateObjs from Firebase
  @override
  Future<List<WeeklyDateObj>> fetchObjs() async {
    final snapshot = await _db.collection(_collectionPath).get();
    var weeklyDateObjs = snapshot.docs
        .map<WeeklyDateObj>((e) => WeeklyDateObj.fromSnapshot(e))
        .toList();
    return weeklyDateObjs;
  }

  // Delete all weeklyDateObjs from Firebase
  @override
  Future<void> deleteObjs() async {
    // Get collection (a list of docs)
    final snapshots = await _db.collection(_collectionPath).get();
    // Delete the docs one by one
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  // Fetch collection (key-value-pair) by id from Fb
  // A part of updateObj
  @override
  Future<Map<String, dynamic>?> fetchCollectionBy(String? id) async {
    final value = await _db.collection(_collectionPath).doc(id).get();
    return value.data();
  }

  // Update collection (key-value-pair) by id, new collection to Fb
  // A part of updateObj
  @override
  void updateCollectionBy(String? id, Map<String, dynamic> updatedCollection) {
    _db.collection(_collectionPath).doc(id).update(updatedCollection);
  }
}
