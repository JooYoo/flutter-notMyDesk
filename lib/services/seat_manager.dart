import 'package:flutter_not_my_desk/models/Seat.dart';

// based on desk-nr check the desk is on left-room or right-room
// FIXME: try to use enum
String calcSide(int deskNr) {
  return deskNr < 17 ? 'left' : 'right';
}

// generate new seats x 32
// mark seats to left/right
List<Seat> generateSeats(int floorId, String floorName, String fullDate) {
  List<Seat> seats = [];

  for (var i = 0; i < 32; i++) {
    int deskNr = i + 1;
    String side = calcSide(deskNr);

    Seat newSeat = Seat(deskNr, floorId, floorName, fullDate, side, '');
    seats.add(newSeat);
  }
  return seats;
}
