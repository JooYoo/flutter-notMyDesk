import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/services/seat_manager.dart';
import 'package:flutter_not_my_desk/widgets/datepicker_weekly.dart';
import 'package:flutter_not_my_desk/widgets/room_widget.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  // props
  final Floor selectedFloor;
  const HomePage(this.selectedFloor, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: check if update based on parent
    inspect("home_page rendered");
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
              // TODO: if need
              // index 0: RoomSide.left
              // index 1: RoomSide.right
            },
          ),
          Flexible(
            flex: 3,
            child: TabBarView(
              children: [
                // left-room
                RoomWidget(
                  RoomSide.left,
                  widget.selectedFloor,
                ),
                // right-room
                RoomWidget(
                  RoomSide.right,
                  widget.selectedFloor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
