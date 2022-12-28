import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/services/seat_manager.dart';
import 'package:flutter_not_my_desk/widgets/datepicker_weekly.dart';
import 'package:flutter_not_my_desk/widgets/room_widget.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';
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

  @override
  void initState() {
    super.initState();
    // init selected-room-side: left
    selectedRoomSide = RoomSide.left;
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
              Tab(text: 'L E F T'),
              Tab(text: 'R I G H T'),
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
                RoomWidget(
                  roomSide: RoomSide.left,
                  selectedFloor: widget.selectedFloor,
                ),
                // right-room
                RoomWidget(
                  roomSide: RoomSide.right,
                  selectedFloor: widget.selectedFloor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
