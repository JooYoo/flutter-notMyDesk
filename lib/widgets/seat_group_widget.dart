import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/widgets/seat_widget.dart';

class SeatGroupWidget extends StatefulWidget {
  // props
  List<Seat> seats;

  SeatGroupWidget({
    Key? key,
    required this.seats,
  }) : super(key: key);

  @override
  State<SeatGroupWidget> createState() => _SeatGroupWidgetState();
}

class _SeatGroupWidgetState extends State<SeatGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        spacing: 20,
        children: [
          // TODO: iterate seats of a group
          for (var seat in widget.seats)
            SeatWidget(
              seat: seat,
            )
        ],
      ),
    );
  }
}
