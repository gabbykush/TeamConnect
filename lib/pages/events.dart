import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/dimension.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
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
    ;
  }
}
