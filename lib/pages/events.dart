import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/Widgets/card.dart';
import 'package:teamconnect/Widgets/ui_components.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/general/styles/colors.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryAccent,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
              top: AppDimensions.defaultPadding,
              left: AppDimensions.defaultPadding,
              right: AppDimensions.defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(context,
                    title: "Events", subtitle: "Upcoming Events"),
                SizedBox(
                  height: AppDimensions.cardsSpacing,
                ),
                EventCard(
                    title: "IEEE Club Meet @ 12 PM",
                    subtitle: "Manhattan campus",
                    time: "April 27"),
                SizedBox(
                  height: AppDimensions.cardsSpacing,
                ),
                EventCard(
                    title: "TKE hot sauce event",
                    subtitle: "Long Island Campus ",
                    time: "April 30"),
                SizedBox(
                  height: AppDimensions.cardsSpacing,
                ),
                EventCard(
                    title: "Discovery day",
                    subtitle: "Long Island Campus ",
                    time: "May 3rd"),
                SizedBox(
                  height: AppDimensions.cardsSpacing,
                ),
                EventCard(
                    title: "Career fair",
                    subtitle: "Manhattan campus",
                    time: "May 5th"),
              ],
            ),
          ),
        )));
    ;
  }
}
