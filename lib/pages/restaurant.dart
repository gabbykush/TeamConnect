import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/Widgets/bottom_nav_bar.dart';
import 'package:teamconnect/general/resources/dimension.dart';

class FoodTabPage extends StatefulWidget {
  @override
  _FoodTabPageState createState() => _FoodTabPageState();
}

class _FoodTabPageState extends State<FoodTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationConnect(index: 2),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
              top: AppDimensions.defaultPadding,
              left: AppDimensions.defaultPadding,
              right: AppDimensions.defaultPadding),
          child: Column(
            children: [
              //_buildTopNavigation(),
            ],
          ),
        )));
  }
}
