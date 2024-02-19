import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mo_tracker/dashboard.dart';
import 'package:mo_tracker/heatControl.dart';
import 'package:mo_tracker/settings.dart';


class MainNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _mainNavState();
}

class _mainNavState extends State<MainNav> {
  int myIndex = 1;
  List<Widget> widgetList = [
    Dashboard(),
    HeatControl(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(119, 32, 32, 1),
                borderRadius: BorderRadius.all(Radius.circular(24))),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: GNav(
              activeColor: Colors.white,
              color: Colors.grey,
              gap: 16,
              selectedIndex: myIndex,
              tabs: [
                GButton(
                  onPressed: (){setState(() {
                    myIndex = 0;
                  });},
                  icon: Icons.dashboard,
                  text: 'Dashboard',
                ),
                GButton(
                  onPressed: (){setState(() {
                    myIndex = 1;
                  });},
                  icon: Icons.local_fire_department,
                  text: 'Control Pad',
                ),
                GButton(
                  onPressed: (){setState(() {
                    myIndex = 2;
                  });},
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: myIndex,
          children: widgetList,
        ));
  }
}
