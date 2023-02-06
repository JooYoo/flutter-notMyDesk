// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';

class WeeklyDateObj {
  final String? id;
  final String fullDate;
  final List<Floor> floors;

  WeeklyDateObj({this.id, required this.fullDate, required this.floors});

  // When write data to Firebase
  Map<String, dynamic> toJson() {
    return {"fullDate": fullDate, "floors": floors};
  }

  // Decode fetched data from Firebase
  factory WeeklyDateObj.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return WeeklyDateObj(
        id: document.id,
        fullDate: data["fullDate"],
        floors: List<Floor>.from(data["floors"].map((x) => Floor.fromMap(x))));
  }
}
