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

    Seat newSeat = Seat(
        deskNr: deskNr,
        floorId: floorId,
        floorName: floorName,
        fullDate: fullDate,
        side: side,
        occupied: '');

    seats.add(newSeat);
  }
  return seats;
}

// get left/right-seats from the selected-floor
List<Seat> getSelectedFloorSeatsForOneRoom(
    Floor selectedFloor, RoomSide roomSide) {
  // get selected-floor-seats
  var selectedFloorSeats = selectedFloor.seats;

  // get current floor left/right seats
  var seats = selectedFloorSeats!.where(
    (seat) => seat.side == roomSide.name,
  );

  return seats.toList();
}

// gather one-side-seats for ui
// e.g. [seat, seat, seat...], [2,3...] -> [[seat, seat], [seat, seat, seat]...]
List<List<Seat>> divideSeatsToGroupsForOneRoom(
  List<Seat> oneRoomSeats,
  List<int> eachGroupSeatCounts,
) {
  List<List<Seat>> seatGroups = [];
  // ignore: unused_local_variable
  var index = 0;

  // iterate each-group-seat-counts
  // e.g. [6, 6, 4]: 3groups in total, each group contains 6seats, 6seats, 4seats
  for (var currGroupSeatCount in eachGroupSeatCounts) {
    // create a new seat-group
    List<Seat> newSeatGroup = [];
    for (var i = 0; i < currGroupSeatCount; i++) {
      newSeatGroup.add(oneRoomSeats[index]);
      index++;
    }
    // [] -> [[seat, seat, seat], [...]]
    seatGroups.add(newSeatGroup);
  }

  return seatGroups;
}

// the main func to prepare seat-groups for UI
//    - selectedFloor: the floor is selected by clicking side_nav
//    - roomSide: the room-side is selected by clicking tab_bar_tabs
// call the func when
//    - selected-floor is changed
//    - room-side is changed
List<List<Seat>> renderSeatGroupsForOneRoom(
  Floor selectedFloor,
  RoomSide roomSide,
) {
  // get seats for one-side-room from selected-floor
  var oneRoomSeats = getSelectedFloorSeatsForOneRoom(selectedFloor, roomSide);
  // divide one-side-room-seats to seat-groups
  var oneRoomSeatGroups =
      divideSeatsToGroupsForOneRoom(oneRoomSeats, [6, 6, 4]);

  return oneRoomSeatGroups;
}
