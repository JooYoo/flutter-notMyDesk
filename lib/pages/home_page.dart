import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // left/right content
  final List<Widget> _rooms = [
    const Center(child: Text("left seats")),
    const Center(child: Text("right seats"))
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'LEFT'),
              Tab(text: 'RIGHT'),
            ],
          ),
        ),
        body: TabBarView(children: _rooms),
      ),
    ));
  }
}
