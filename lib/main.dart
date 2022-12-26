import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/pages/about_page.dart';
import 'package:flutter_not_my_desk/pages/home_page.dart';
import 'package:flutter_not_my_desk/widgets/side_nav.dart';
import 'models/Floor.dart';

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
  // onTap to set selected-index
  int _selectedNavIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  // collection of pages
  final List<Widget> _pages = [HomePage(), const AboutPage()];

  // data store
  final List<Floor> floors = [
    Floor(3, "3rd Floor", "2022-12-24"),
    Floor(4, "4th Floor", "2022-12-24"),
    Floor(5, "5th Floor", "2022-12-24")
  ];

  /* ---------------------------- data-store: Floor ---------------------------- */
  // selected-floor
  late Floor selectedFloor;
  // switch floor
  void switchFloor(Floor clickedFloor) {
    setState(() {
      selectedFloor = clickedFloor;
    });
    print('switch floor to: ${selectedFloor.floorName}');
  }

  @override
  void initState() {
    super.initState();

    // sort floors descending
    floors.sort((a, b) => b.id.compareTo(a.id));
    // set default selected-floor to 3rd-floor
    switchFloor(floors.last);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedFloor.floorName),
        actions: [
          IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                print("settings pressed");
              })
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: SideDrawer(
        floors: floors,
        selectedFloor: selectedFloor,
        switchFloor: switchFloor,
      ),
      body: _pages[_selectedNavIndex],
      // FIXME: refactor to independent widget
      // BottomNav() emit _selectedNavIndex
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
