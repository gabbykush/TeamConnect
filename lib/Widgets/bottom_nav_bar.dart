import 'package:flutter/material.dart';
import 'package:teamconnect/general/styles/colors.dart';
import 'package:teamconnect/pages/events.dart';
import 'package:teamconnect/pages/groups.dart';
import 'package:teamconnect/pages/homepage.dart';
import 'package:teamconnect/pages/profile.dart';
import 'package:teamconnect/pages/restaurant.dart';

class BottomNavigationConnect extends StatefulWidget {
  @override
  _BottomNavigationConnect createState() => _BottomNavigationConnect();
}

class _BottomNavigationConnect extends State<BottomNavigationConnect> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    GroupsPage(),
    EventPage(),
    FoodTabPage(),
    ProfilePage()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryAccent,
        unselectedItemColor: AppColors.primaryAccent,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        onTap: _onItemTap,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text("Groups"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text("Events"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            title: Text("Food Delivery"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
