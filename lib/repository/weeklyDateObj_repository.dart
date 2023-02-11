// ignore_for_file: file_names
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';
import 'package:flutter_not_my_desk/services/time_manager.dart';
import 'package:flutter_not_my_desk/services/weekly_floor_manager.dart';

class WeeklyDateObjRepository {
  final _db = FirebaseFirestore.instance;

  // firebase - fetch document from Firebase
  Future<List<WeeklyDateObj>> getWeeklyDateObjs() async {
    final snapshot = await _db.collection("weeklyDateObjs").get();
    var weeklyDateObjs = snapshot.docs
        .map<WeeklyDateObj>((e) => WeeklyDateObj.fromSnapshot(e))
        .toList();

    // if fb is empty then generate
    if (weeklyDateObjs.isEmpty) {
      weeklyDateObjs = generateWeeklyDateObjs([3, 4, 5]);
      // save new generated objs into fb
      fbSaveData(weeklyDateObjs);
    }

    // if fb-data is out of date, generate new
    if (isWeeklyDateObjsOutOfDate(weeklyDateObjs)) {
      // TODO: clean up fb

      // generate new objs
      weeklyDateObjs = generateWeeklyDateObjs([3, 4, 5]);
      // save new generated objs into fb
      fbSaveData(weeklyDateObjs);
    }

    return weeklyDateObjs;
  }

  // Delete objes from fb
  fbDeleteData() async {
    // var collection = FirebaseFirestore.instance.collection('weeklyDateObjs');
    // var snapshots = await collection.get();
    final snapshots = await _db.collection("weeklyDateObjs").get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  // Save objs to empty fb
  fbSaveData(List<WeeklyDateObj> weeklyDateObjs) {
    for (var obj in weeklyDateObjs) {
      _db.collection("weeklyDateObjs").add(obj.toJson());
    }
  }

  // firebase - update document in Firebase
  Future<void> fbUpdateObj(
      List<WeeklyDateObj> weeklyDateObjs, Seat selectedSeat) async {
    // find selected-DateObj based on selected-seat-fullDate
    var localSelectedWeeklyDateObj = weeklyDateObjs.firstWhere(
        (weeklyDateObj) => weeklyDateObj.fullDate == selectedSeat.fullDate);
    // selected-weekly-dateObj id
    var selectedObjId = localSelectedWeeklyDateObj.id;

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
    fbSeat['occupiedBy'] = selectedSeat.occupiedBy;

    // update doc based on ID in Firestore
    _db.collection("weeklyDateObjs").doc(selectedObjId).update(readyUpdateObj);
  }
}
