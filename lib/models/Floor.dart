// ignore_for_file: file_names

import 'package:flutter_not_my_desk/features/weekly_date_objs/data/models/Seat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Floor.g.dart';

@JsonSerializable(explicitToJson: true)
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

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);

  // When write data to Firebase
  // toJson() {
  //   return {
  //     "id": id,
  //     "floorName": floorName,
  //     "fullDate": fullDate,
  //     "seats": seats
  //   };
  // }

  // Decode fetched data from Firebase
  // factory Floor.fromMap(Map<String, dynamic> data) {
  //   return Floor(
  //       id: data['id'],
  //       floorName: data['floorName'],
  //       fullDate: data['fullDate'],
  //       seats: List<Seat>.from(data['seats'].map((x) => Seat.fromMap(x))));
  // }
}
