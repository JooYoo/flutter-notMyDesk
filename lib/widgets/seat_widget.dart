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
  TextEditingController occupyController = TextEditingController();
  String occupiedBy = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: OutlinedButton(
        child: Text(widget.seat.deskNr.toString()),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                final MediaQueryData mediaQueryData = MediaQuery.of(context);
                return Padding(
                  padding: mediaQueryData.viewInsets,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Spacer(),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.seat.occupied == ''
                                    ? "Empty"
                                    : widget.seat.occupied,
                                style: const TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.seat.fullDate,
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 32),
                              TextField(
                                controller: occupyController,
                                onChanged: (value) {
                                  print(occupiedBy);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  labelText: 'Occupy Name',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${widget.seat.floorName}, ${widget.seat.side}, ${widget.seat.deskNr.toString()}",
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size.fromHeight(50)),
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Save and close'),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
