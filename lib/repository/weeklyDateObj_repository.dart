// ignore_for_file: file_names
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

class WeeklyDateObjRepository {
  final _db = FirebaseFirestore.instance;

  // firebase - fetch document from Firebase
  Future<List<WeeklyDateObj>> getWeeklyDateObjs() async {
    final snapshot = await _db.collection("weeklyDateObjs").get();
    var weeklyDateObjs = snapshot.docs
        .map<WeeklyDateObj>((e) => WeeklyDateObj.fromSnapshot(e))
        .toList();
    // TODO: if fb is empty then generate
    return weeklyDateObjs;
  }

  // firebase - update document in Firebase
  Future<void> fbUpdateObj(
      List<WeeklyDateObj> weeklyDateObjs, Seat selectedSeat) async {
    // find selected-DateObj based on selected-seat-fullDate
    var localSelectedWeeklyDateObj = weeklyDateObjs.firstWhere(
        (weeklyDateObj) => weeklyDateObj.fullDate == selectedSeat.fullDate);
    // selected-weekly-dateObj id
    var selectedObjId = localSelectedWeeklyDateObj.id;

    // FIXME: works, refactoring needed
    // fetch data from Firebase
    final value =
        await _db.collection("weeklyDateObjs").doc(selectedObjId).get();
    final readyUpdateObj = value.data();

    // find the property in nested-firebase-object then update it by using local object
    var fbFloors = readyUpdateObj!['floors']
        .map((item) => item as Map<String, dynamic>)
        .toList();
    var fbFloor =
        fbFloors.firstWhere((item) => item['id'] == selectedSeat.floorId);
    var fbSeat = fbFloor['seats']
        .firstWhere((item) => item['deskNr'] == selectedSeat.deskNr);
    fbSeat['occupiedBy'] = selectedSeat.occupied;

    // update doc based on ID in Firestore
    _db.collection("weeklyDateObjs").doc(selectedObjId).update(readyUpdateObj);
  }
}
