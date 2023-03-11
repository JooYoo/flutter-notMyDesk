// ignore_for_file: file_names
// run json_serializable generator: `flutter pub run build_runner build`

import 'package:json_annotation/json_annotation.dart';

part 'Seat.g.dart';

@JsonSerializable()
class Seat {
  int deskNr;
  int floorId;
  String floorName;
  String fullDate;
  String side;
  String occupiedBy;

  Seat(
      {required this.deskNr,
      required this.floorId,
      required this.floorName,
      required this.fullDate,
      required this.side,
      required this.occupiedBy});

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);

  Map<String, dynamic> toJson() => _$SeatToJson(this);
}
