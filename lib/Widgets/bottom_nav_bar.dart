import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/routes.dart';
import 'package:teamconnect/general/styles/colors.dart';

class _Constant {
  static const double cardInsets = 0;
  static const double iconBackgroundCornerRadius = 20;
}

class Items {
  static Widget firstIcon = Icons.group as Widget;
  static Widget secondIcon = Icons.event as Widget;
  static Widget thirdIcon = Icons.delivery_dining as Widget;
  static Widget forthIcon = Icons.account_circle as Widget;
  static Widget firstIconName = "Groups" as Widget;
  static Widget secondIconName = "Events" as Widget;
  static Widget thirdIconName = "Food Delivery" as Widget;
  static Widget forthIconName = "Profile" as Widget;
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key, @required index}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

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
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryAccent,
          unselectedItemColor: AppColors.gray,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          backgroundColor: AppColors.secondaryAccent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Items.firstIcon,
              title: Items.firstIconName,
            ),
            BottomNavigationBarItem(
              icon: Items.secondIcon,
              title: Items.secondIconName,
            ),
            BottomNavigationBarItem(
              icon: Items.thirdIcon,
              title: Items.thirdIconName,
            ),
            BottomNavigationBarItem(
              icon: Items.forthIcon,
              title: Items.forthIconName,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            _onItemTapped(context, _currentIndex, index);
          },
        ),
      ),
    );
  }
}

_onItemTapped(context, int index, int _currentIndex) {
  if (index == 0) {
    print('index=0');
    //Navigator.of(context).pushNamed(Routes.groups);
  }
  if (index == 1) {
    print('index=1');
    //Navigator.of(context).pushNamed(Routes.events);
  }
  if (index == 2) {
    print('index=2');
    //Navigator.of(context).pushNamed(Routes.foodDelivery);
  }
  if (index == 3) {
    print('index=3');
    //Navigator.of(context).pushNamed(Routes.profile);
  }
}
