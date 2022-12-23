import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/widgets/datepicker_weekly.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // left/right content
  final List<Widget> _rooms = [
    const Center(child: Text("left seats")),
    const Center(child: Text("right seats"))
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          // TODO: try to change the bg to white
          // ignore: prefer_const_constructors
          Flexible(
            flex: 1,
            child: const DatePickerWeekly(),
          ),
          const TabBar(
            labelColor: Colors.black,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.5,
                  color: Colors.black,
                ),
              ),
            ),
            tabs: [
              Tab(text: 'LEFT'),
              Tab(text: 'RIGHT'),
            ],
          ),
          Flexible(
            flex: 3,
            child: TabBarView(children: _rooms),
          ),
        ],
      ),
    );
  }
}
