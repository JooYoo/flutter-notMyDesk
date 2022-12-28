import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/services/seat_manager.dart';
import 'package:flutter_not_my_desk/widgets/datepicker_weekly.dart';
import 'package:flutter_not_my_desk/widgets/seat_group_widget.dart';
import '../models/Floor.dart';
import '../widgets/seat_widget.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  // props
  Floor selectedFloor;

  HomePage({
    Key? key,
    required this.selectedFloor,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // switch room when click tab_bar_tabs
  late RoomSide selectedRoomSide;
  void switchRoomSide(int index) {
    var selectedSide = index == 0 ? RoomSide.left : RoomSide.right;
    setState(() {
      selectedRoomSide = selectedSide;
    });
  }

  // current-room-seat-groups
  late List<List<Seat>> currentRoomSeatGroups;

  @override
  void initState() {
    super.initState();
    // init selected-room-side: left
    selectedRoomSide = RoomSide.left;

    // init room-seat-groups
    currentRoomSeatGroups =
        renderSeatGroupsForOneRoom(widget.selectedFloor, selectedRoomSide);
    inspect(currentRoomSeatGroups);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          // ignore: prefer_const_constructors
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: const DatePickerWeekly(),
            ),
          ),
          TabBar(
            labelColor: Colors.black,
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.5,
                  color: Colors.black,
                ),
              ),
            ),
            tabs: const [
              Tab(text: 'LEFT'),
              Tab(text: 'RIGHT'),
            ],
            onTap: (index) {
              switchRoomSide(index);
            },
          ),
          Flexible(
            flex: 3,
            child: TabBarView(
              children: [
                // left-room
                Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    children: [
                      // TODO: foreach bottom-sheet-button-group
                      // for (var seat in leftSeats)
                      for (var oneGroupSeats in currentRoomSeatGroups)
                        SeatGroupWidget(seats: oneGroupSeats)
                    ],
                  ),
                ),
                // right-room
                Center(child: Text("right seats"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
