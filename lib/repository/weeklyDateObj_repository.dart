// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

class WeeklyDateObjRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<WeeklyDateObj>> getWeeklyDateObjs() async {
    final snapshot = await _db.collection("weeklyDateObjs").get();
    final weeklyDateObjs = snapshot.docs
        .map<WeeklyDateObj>((e) => WeeklyDateObj.fromSnapshot(e))
        .toList();
    return weeklyDateObjs;
  }
}
