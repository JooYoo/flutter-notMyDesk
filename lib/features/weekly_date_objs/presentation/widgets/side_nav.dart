import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/presentation/providers/weekly_date_obj_provider.dart';
import 'package:flutter_not_my_desk/services/weekly_floor_manager.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    var weeklyDateObjs = context.watch<WeeklyDateObjProvider>().weeklyDateObjs;
    var selectedFloor = context.watch<WeeklyDateObjProvider>().selectedFloor;
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
                selectedFloor.floorName,
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
              tileColor: (selectedFloor.id == floor.id)
                  ? Colors.grey[300]
                  : Colors.transparent,
            )
        ],
      ),
    );
  }
}
