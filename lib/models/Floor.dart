// ignore_for_file: file_names

import 'package:flutter_not_my_desk/models/Seat.dart';

class Floor {
  final int id;
  final String floorName;
  final String fullDate;
  final List<Seat> seats;

  Floor(
      {required this.id,
      required this.floorName,
      required this.fullDate,
      required this.seats});

  // Decode fetched data from Firebase
  factory Floor.fromMap(Map<String, dynamic> data) {
    return Floor(
        id: data['id'],
        floorName: data['floorName'],
        fullDate: data['fullDate'],
        seats: List<Seat>.from(data['seats'].map((x) => Seat.fromMap(x))));
  }
}
