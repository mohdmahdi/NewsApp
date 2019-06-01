import 'package:flutter/material.dart';

class navigationDrawer extends StatefulWidget {
  @override
  _navigationDrawerState createState() => _navigationDrawerState();
}

class _navigationDrawerState extends State<navigationDrawer> {
  List<String> navMenu = [
    'Explore',
    'Headlines News',
    'Read Later',
    'Videos',
    'Photos',
    'Settings',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 6, left: 24),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: ListTile(
                title: Text(
                  navMenu[position],
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {},
              ),
            );
          },
          itemCount: navMenu.length,
        ),
      ),
    );
  }
}
