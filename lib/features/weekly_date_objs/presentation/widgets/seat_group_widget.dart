import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/models/Seat.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/presentation/widgets/seat_widget.dart';

class SeatGroupWidget extends StatefulWidget {
  // props
  final List<Seat> seats;
  const SeatGroupWidget(this.seats, {super.key});

  @override
  State<SeatGroupWidget> createState() => _SeatGroupWidgetState();
}

class _SeatGroupWidgetState extends State<SeatGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 10,
        children: [
          // iterate seats of a group
          for (var seat in widget.seats)
            SeatWidget(
              seat,
            )
        ],
      ),
    );
  }
}
