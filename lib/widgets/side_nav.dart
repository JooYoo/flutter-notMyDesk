import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';

class SideDrawer extends StatefulWidget {
  // props
  List<Floor> floors;
  Floor selectedFloor;
  Function switchFloor;

  SideDrawer(
      {Key? key,
      required this.floors,
      required this.selectedFloor,
      required this.switchFloor})
      : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          DrawerHeader(
            child: Align(
              child: Text(
                widget.selectedFloor.floorName,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
          for (var floor in widget.floors) // iterate floors
            ListTile(
              title: Text(
                floor.floorName,
                style: const TextStyle(fontSize: 20),
              ),
              onTap: () {
                widget.switchFloor(floor);
              },
              tileColor: (widget.selectedFloor.id == floor.id)
                  ? Colors.grey[300]
                  : Colors.transparent,
            )
        ],
      ),
    );
  }
}
