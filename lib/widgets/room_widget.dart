import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/services/seat_manager.dart';
import 'package:flutter_not_my_desk/widgets/seat_group_widget.dart';
import 'dart:developer';

class RoomWidget extends StatefulWidget {
  final RoomSide roomSide;
  final Floor selectedFloor;
  const RoomWidget(this.roomSide, this.selectedFloor, {super.key});

  @override
  State<RoomWidget> createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  late List<List<Seat>> currentRoomSeatGroups;

  @override
  Widget build(BuildContext context) {
    // render room-seat-groups
    currentRoomSeatGroups =
        renderSeatGroupsForOneRoom(widget.selectedFloor, widget.roomSide);

    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        alignment: widget.roomSide == RoomSide.left
            ? WrapAlignment.start
            : WrapAlignment.end,
        runSpacing: 20,
        children: [
          // iterate current-room-seat-groups
          for (var oneGroupSeats in currentRoomSeatGroups)
            SizedBox(
              width: oneGroupSeats.length == 4 ? 300 : double.infinity,
              child: SeatGroupWidget(oneGroupSeats),
            )
        ],
      ),
    );
  }
}
