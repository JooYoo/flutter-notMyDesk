import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/services/seat_manager.dart';
import 'package:flutter_not_my_desk/widgets/datepicker_weekly.dart';
import '../models/Floor.dart';
import '../widgets/bottom_sheet_button.dart';
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
  // left/right room widgets
  late List<Widget> _rooms;

  // left-room seats
  late List<Seat> leftSeats;

  @override
  void initState() {
    super.initState();

    // ✅ get selected-floor
    // TODO: get room-side
    // TODO: get seats by room-side
    leftSeats = getSelectedFloorLeftSeats(widget.selectedFloor, RoomSide.left);
    inspect(leftSeats);

    /* --------------------------------- init UI -------------------------------- */
    _rooms = [
      const Center(child: BottomSheetButton()),
      const Center(child: Text("right seats"))
    ];
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
          const TabBar(
            labelColor: Colors.black,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.5,
                  color: Colors.black,
                ),
              ),
            ),
            tabs: [
              Tab(text: 'LEFT'),
              Tab(text: 'RIGHT'),
            ],
          ),
          Flexible(
            flex: 3,
            child: TabBarView(children: _rooms),
          ),
        ],
      ),
    );
  }
}
