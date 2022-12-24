import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  // collection of floors
  var floors = [
    Floor(3, "3rd Floor", "2022-12-24"),
    Floor(4, "4th Floor", "2022-12-24"),
    Floor(5, "5th Floor", "2022-12-24")
  ];

  // switch Floor to get selected-floor
  void switchFloor(Floor selectedFloor) {
    // TODO: emit selected-floor to parent-widget
    print(selectedFloor.floorName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const DrawerHeader(
            child: Align(
              child: Text(
                'L O G O',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          for (var floor in floors) // iterate floors
            ListTile(
              // ignore: prefer_const_constructors
              title: Text(
                floor.floorName,
                style: const TextStyle(fontSize: 20),
              ),
              onTap: () {
                switchFloor(floor);
              },
            )
        ],
      ),
    );
  }
}
