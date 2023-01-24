// ignore_for_file: file_names

class Seat {
  int deskNr;
  int floorId;
  String floorName;
  String fullDate;
  String side;
  String occupied;

  Seat(
    this.deskNr,
    this.floorId,
    this.floorName,
    this.fullDate,
    this.side,
    this.occupied,
  );

  // TODO: decode data from Firebase
  // factory Seat.fromMap(Map<String, dynamic> data) {
  //   return Seat(
  //     deskNr: data['deskNr'],

  //   );
  // }
}
