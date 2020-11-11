import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/routes.dart';
import 'package:teamconnect/general/styles/colors.dart';

class _Constant {
  static const double cardInsets = 0;
  static const double iconBackgroundCornerRadius = 20;
}

class BottomNavigationConnect extends StatefulWidget {
  BottomNavigationConnect({Key key, @required index}) : super(key: key);

  @override
  _BottomNavigationConnect createState() => _BottomNavigationConnect();
}

class _BottomNavigationConnect extends State<BottomNavigationConnect> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_Constant.iconBackgroundCornerRadius),
              topRight: Radius.circular(_Constant.iconBackgroundCornerRadius))),
      child: Padding(
        padding: const EdgeInsets.only(top: _Constant.cardInsets),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryAccent,
          unselectedItemColor: AppColors.gray,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          backgroundColor: AppColors.secondaryAccent,
          items: <BottomNavigationBarItem>[
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
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _onItemTapped(context, _selectedIndex);
          },
        ),
      ),
    );
  }
}

_onItemTapped(context, int index) {
  if (index == 0) {
    print('index=0');
    Navigator.of(context).pushNamed(Routes.groupTab);
  }
  if (index == 1) {
    print('index=1');
    Navigator.of(context).pushNamed(Routes.eventsTab);
  }
  if (index == 2) {
    print('index=2');
    Navigator.of(context).pushNamed(Routes.foodTab);
  }
  if (index == 3) {
    print('index=3');
    Navigator.of(context).pushNamed(Routes.profileTab);
  }
}
