import 'package:flutter_not_my_desk/models/Floor.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';

enum RoomSide { left, right }

// based on desk-nr check the desk is on left-room or right-room
String calcSide(int deskNr) {
  return deskNr < 17 ? RoomSide.left.name : RoomSide.right.name;
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

// get left-seats from the selected-floor
// get right-seats from the selected-floor
List<Seat> getSelectedFloorLeftSeats(Floor selectedFloor, RoomSide roomSide) {
  // get selected-floor-seats
  var selectedFloorSeats = selectedFloor.seats;

  // get current floor left/right seats
  var seats = selectedFloorSeats!.where(
    (seat) => seat.side == roomSide.name,
  );

  return seats.toList();
}
