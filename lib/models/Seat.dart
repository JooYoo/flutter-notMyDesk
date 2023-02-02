// ignore_for_file: file_names

class Seat {
  int deskNr;
  int floorId;
  String floorName;
  String fullDate;
  String side;
  String occupied;

  Seat(
      {required this.deskNr,
      required this.floorId,
      required this.floorName,
      required this.fullDate,
      required this.side,
      required this.occupied});

  // When write data to Firebase
  toJson() {
    return {
      "deskNr": deskNr,
      "floorId": floorId,
      "floorName": floorName,
      "fullDate": fullDate,
      "side": side,
      "occupiedBy": occupied
    };
  }

  // Decode data from Firebase
  factory Seat.fromMap(Map<String, dynamic> data) {
    return Seat(
        deskNr: data['deskNr'],
        floorId: data['floorId'],
        floorName: data['floorName'],
        fullDate: data['fullDate'],
        side: data['side'],
        occupied: data['occupiedBy'] ?? "");
  }
}
