import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';

class SeatWidget extends StatefulWidget {
  // props
  final Seat seat;
  const SeatWidget(this.seat, {super.key});

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: OutlinedButton(
        child: Text(widget.seat.deskNr.toString()),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: ((context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    // TODO: check if data is rerenderable when change date
                    Text(widget.seat.fullDate),
                    Text(widget.seat.floorName),
                    Text(widget.seat.side),
                    Text(widget.seat.deskNr.toString()),
                    const Spacer(),
                    OutlinedButton(
                      child: const Text('Close'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                  ],
                )),
          );
        },
      ),
    );
  }
}
