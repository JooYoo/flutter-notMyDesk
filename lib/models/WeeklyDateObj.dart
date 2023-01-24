// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';

class WeeklyDateObj {
  final String fullDate;
  final List<Floor> floors;

  WeeklyDateObj({required this.fullDate, required this.floors});

  // Decode fetched data from Firebase
  factory WeeklyDateObj.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return WeeklyDateObj(fullDate: data["fullDate"], floors: data["floors"]);
  }
}
