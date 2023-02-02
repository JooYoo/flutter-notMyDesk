// ignore_for_file: file_names
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
    var selectedWeeklyDateObj = weeklyDateObjs.firstWhere(
        (weeklyDateObj) => weeklyDateObj.fullDate == selectedSeat.fullDate);
    // selected-weekly-dateObj floors
    // var selectedObjFloors = selectedWeeklyDateObj.floors;
    // selected-weekly-dateObj id
    // var selectedObjId = selectedWeeklyDateObj.id;

    // update doc based on ID in Firestore
    _db
        .collection("weeklyDateObjs")
        .doc(selectedWeeklyDateObj.id)
        .update(selectedWeeklyDateObj.toJson());
  }
}
