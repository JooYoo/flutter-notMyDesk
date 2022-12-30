import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/Floor.dart';
import 'package:flutter_not_my_desk/providers/weekly_date_obj_provider.dart';
import 'package:flutter_not_my_desk/services/weekly_floor_manager.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  // props
  Floor selectedFloor;
  SideDrawer({Key? key, required this.selectedFloor}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    var weeklyDateObjs = context.watch<WeeklyDateObjProvider>().weeklyDateObjs;
    var selectedFullDate =
        context.watch<WeeklyDateObjProvider>().selectedFullDate;

    // get selected-date-floors
    var floors = getSelectedDateFloors(weeklyDateObjs, selectedFullDate);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Align(
              child: Text(
                widget.selectedFloor.floorName,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
          for (var floor in floors) // iterate floors
            ListTile(
              title: Text(
                floor.floorName,
                style: const TextStyle(fontSize: 20),
              ),
              onTap: () {
                // set floor by selected-date, floor-id
                context.read<WeeklyDateObjProvider>().setSelectedFloorBy(
                      weeklyDateObjs,
                      selectedFullDate,
                      floor.id,
                    );
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
