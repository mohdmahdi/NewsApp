import 'package:flutter/material.dart';
import 'package:newa_app/models/nav_menu.dart';
import 'package:newa_app/screens/headline_news.dart';
import 'package:newa_app/screens/home_screen.dart';


class navigationDrawer extends StatefulWidget {
  @override
  _navigationDrawerState createState() => _navigationDrawerState();
}

class _navigationDrawerState extends State<navigationDrawer> {

  List<NavMenuItem>  navigationMenu = [
    NavMenuItem("Explore", () => Home_screen()),
    NavMenuItem("Headlines News", ()=> HeadLineNews()),
  ];

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
                  navigationMenu[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return navigationMenu[position].destination();
                  }));
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
