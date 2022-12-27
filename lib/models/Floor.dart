// ignore_for_file: file_names

import 'package:flutter_not_my_desk/models/Seat.dart';

class Floor {
  int id;
  String floorName;
  String fullDate;
  List<Seat>? seats; // TODO: after generated, remove optional

  Floor(this.id, this.floorName, this.fullDate, [this.seats]);
}
