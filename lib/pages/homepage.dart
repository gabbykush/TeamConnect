import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/Widgets/bottom_nav_bar.dart';
import 'package:teamconnect/general/resources/dimension.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationConnect(index: 0),
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

  _buildTopNavigation() {
    return "sto";
  }
}
