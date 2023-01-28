import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_not_my_desk/pages/about_page.dart';
import 'package:flutter_not_my_desk/pages/home_page.dart';
import 'package:flutter_not_my_desk/providers/weekly_date_obj_provider.dart';
import 'package:flutter_not_my_desk/repository/weeklyDateObj_repository.dart';
import 'package:flutter_not_my_desk/widgets/appbar_settings_button.dart';
import 'package:flutter_not_my_desk/widgets/side_nav.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

Future main() async {
  // load .env
  await dotenv.load(fileName: "lib/.env");
  // init firebase
  await Firebase.initializeApp();
  // TODO: check if get data from Firestore
  var weeklyDateObjRepository = WeeklyDateObjRepository();
  await weeklyDateObjRepository.getWeeklyDateObjs();

  // Portait-up only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      // Provider: share state globally
      ChangeNotifierProvider<WeeklyDateObjProvider>(
        child: const MyApp(),
        create: (_) => WeeklyDateObjProvider(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // The root of the app
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

  @override
  Widget build(BuildContext context) {
    var selectedFloor = context.watch<WeeklyDateObjProvider>().selectedFloor;

    // bottom navbar corresponding page
    _pages = [
      const HomePage(),
      const AboutPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedFloor.floorName),
        actions: const [AppBarSettingsButton()],
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: const SideDrawer(),
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
