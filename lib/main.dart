import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';
import 'package:flutter_not_my_desk/pages/about_page.dart';
import 'package:flutter_not_my_desk/pages/home_page.dart';
import 'package:flutter_not_my_desk/services/time_manager.dart';
import 'package:flutter_not_my_desk/services/weekly_floor_manager.dart';
import 'package:flutter_not_my_desk/widgets/appbar_settings_button.dart';
import 'package:flutter_not_my_desk/widgets/side_nav.dart';
import 'models/Floor.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  /* ------------------------------- view-store ------------------------------- */
  // onTap to set selected-index
  int _selectedNavIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  // collection of pages
  late List<Widget> _pages;

  /* ---------------------------- data-store: Floor ---------------------------- */
  // selected-floors based on full-date
  late List<Floor> selectedDateFloors;
  // selected-floor
  late Floor selectedFloor;
  // switch floor
  void switchFloor(Floor clickedFloor) {
    setState(() {
      selectedFloor = clickedFloor;
    });
  }

  /* ---------------------- data-store: weekly-date-objs ---------------------- */
  late List<WeeklyDateObj> weeklyDateObjs;
  void initSelectedDateFloors() {
    // get main current-week-date-objs
    weeklyDateObjs = generateWeeklyDateObjs([3, 4, 5]);
    // get today-full-date
    String currentFullDate = getCurrentFullDate();
    // get selected-date floors
    selectedDateFloors = getSelectedDateFloors(
      weeklyDateObjs,
      currentFullDate,
    );
    // set default selected-floor to 3rd-floor
    switchFloor(selectedDateFloors.last);
  }

  @override
  void initState() {
    super.initState();
    // set floors based on current-date
    initSelectedDateFloors();

    // bottom navbar corresponding page
    _pages = [
      HomePage(selectedFloor: selectedFloor),
      const AboutPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedFloor.floorName),
        actions: const [AppBarSettingsButton()],
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: SideDrawer(
        floors: selectedDateFloors,
        selectedFloor: selectedFloor,
        switchFloor: switchFloor,
      ),
      body: _pages[_selectedNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.4),
        backgroundColor: Colors.white,
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
