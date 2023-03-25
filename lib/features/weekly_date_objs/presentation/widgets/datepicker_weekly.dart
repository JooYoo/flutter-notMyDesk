import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/presentation/providers/weekly_date_obj_provider.dart';
import 'package:flutter_not_my_desk/services/time_manager.dart';
import 'package:provider/provider.dart';

class DatePickerWeekly extends StatefulWidget {
  const DatePickerWeekly({super.key});

  @override
  State<DatePickerWeekly> createState() => _DatePickerWeeklyState();
}

class _DatePickerWeeklyState extends State<DatePickerWeekly> {
  @override
  Widget build(BuildContext context) {
    // watch states
    var floorId = context.watch<WeeklyDateObjProvider>().selectedFloor.id;
    var weeklyDateObjs = context.watch<WeeklyDateObjProvider>().weeklyDateObjs;

    return Container(
      margin: const EdgeInsets.only(top: 8, left: 16, bottom: 12),
      child: SingleChildScrollView(
        child: DatePicker(
          getCurrentWeekMonday(
            DateTime.now(),
          ), // start-day should be current week Monday
          height: 100,
          width: 48,
          initialSelectedDate: DateTime.now(), // init selected-date is today
          daysCount: 7,
          selectionColor: Colors.black,
          selectedTextColor: Colors.white,
          dateTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          onDateChange: (date) {
            var selectedFullDate = calcFullDate(date);
            // set floor by selected-date, floor-id
            context.read<WeeklyDateObjProvider>().setSelectedFloorBy(
                  weeklyDateObjs,
                  selectedFullDate,
                  floorId,
                );
          },
        ),
      ),
    );
  }
}
