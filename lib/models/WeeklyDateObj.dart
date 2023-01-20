// ignore_for_file: file_names

import 'package:flutter_not_my_desk/models/Floor.dart';

class WeeklyDateObj {
  String fullDate;
  List<Floor> floors;

  WeeklyDateObj(this.fullDate, this.floors);

  // Decode fetched data from Firebase
  // factory WeeklyDateObj.fromSnapshot(){
  //   return WeeklyDateObj(fullDate, floors)
  // }
}
