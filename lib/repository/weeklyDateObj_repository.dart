// ignore_for_file: file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

class WeeklyDateObjRepository {
  final _db = FirebaseFirestore.instance;

  Future getWeeklyDateObjs() async {
    final snapshot = await _db.collection("weeklyDateObjs").get();
    snapshot.docs.map((e) => {log("✅ $e")});
  }
}
