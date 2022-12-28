import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';

class SeatWidget extends StatefulWidget {
  // props
  Seat seat;

  SeatWidget({
    Key? key,
    required this.seat,
  }) : super(key: key);

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        child: Text(widget.seat.deskNr.toString()),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: ((context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TODO: check if data is rerenderable when change date
                    Text(widget.seat.fullDate),
                    OutlinedButton(
                      child: const Text('Close'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                )),
          );
        });
  }
}
