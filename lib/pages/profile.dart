import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/dimension.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
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
