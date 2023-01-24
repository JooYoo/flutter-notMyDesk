// ignore_for_file: file_names

import 'package:flutter_not_my_desk/models/Seat.dart';

class Floor {
  int id;
  String floorName;
  String fullDate;
  List<Seat> seats;

  Floor(this.id, this.floorName, this.fullDate, this.seats);

  // Decode fetched data from Firebase
}
