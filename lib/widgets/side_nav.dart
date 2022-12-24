import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    Key? key,
  }) : super(key: key);

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
          const DrawerHeader(
            child: Align(
              child: Text(
                'L O G O',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          ListTile(
            // ignore: prefer_const_constructors
            title: Text(
              '5th Floor',
              style: const TextStyle(fontSize: 20),
            ),
            onTap: () {
              print("selected 5th");
            },
          ),
          ListTile(
            // ignore: prefer_const_constructors
            title: Text(
              '4th Floor',
              style: const TextStyle(fontSize: 20),
            ),
            onTap: () {
              print("selected 4th");
            },
          ),
          ListTile(
            // ignore: prefer_const_constructors
            title: Text(
              '3rd Floor',
              style: const TextStyle(fontSize: 20),
            ),
            onTap: () {
              print("selected 3rd");
            },
          ),
        ],
      ),
    );
  }
}
