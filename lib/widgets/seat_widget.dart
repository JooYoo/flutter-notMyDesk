import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Seat.dart';
import 'package:flutter_not_my_desk/providers/weekly_date_obj_provider.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

class SeatWidget extends StatefulWidget {
  // props
  final Seat seat;
  const SeatWidget(this.seat, {super.key});

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  // text_field setup
  TextEditingController textFieldController = TextEditingController();
  String occupiedBy = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: OutlinedButton(
        child: Text(
          '${widget.seat.deskNr.toString()}. ${widget.seat.occupiedBy}',
          style: const TextStyle(color: Colors.black),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) {
                final MediaQueryData mediaQueryData = MediaQuery.of(context);
                return Padding(
                  padding: mediaQueryData.viewInsets,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    padding: const EdgeInsets.fromLTRB(20, 62, 20, 32),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.seat.occupiedBy == ''
                                    ? "Empty"
                                    : widget.seat.occupiedBy,
                                style: const TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                "${widget.seat.floorName}・${widget.seat.side}・Desk ${widget.seat.deskNr.toString()}",
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.seat.fullDate,
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 28),
                              TextField(
                                controller: textFieldController,
                                onChanged: (value) {
                                  occupiedBy = value;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'New occupy Name',
                                  labelStyle: TextStyle(
                                    color: Colors.black45,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        // save button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () async {
                            await context
                                .read<WeeklyDateObjProvider>()
                                .setOccupyBy(
                                  widget.seat,
                                  occupiedBy,
                                );
                            // clean up text-field-text
                            textFieldController.clear();
                            // close modal
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                        const SizedBox(height: 8),
                        // close button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            // clean up text-field-text
                            textFieldController.clear();
                            // close modal
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
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
