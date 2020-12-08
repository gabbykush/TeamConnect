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
                    subtitle: "Manhattan campus",
                    time: "April 30"),
              ],
            ),
          ),
        )));
    ;
  }
}

// buildCard() {
//   return GestureDetector(
//     onTap: widget.onPressed,
//     child: Container(
//       child: SafeArea(
//         child: Container(
//             decoration: BoxDecoration(
//                 color: theme.secondaryAccentColor(),
//                 borderRadius: BorderRadius.all(
//                     Radius.circular(_Constant.cardCornerRadius))),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   top: AppDimensions.defaultPadding,
//                   left: AppDimensions.defaultPadding,
//                   right: AppDimensions.defaultPadding),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(height: AppDimensions.cardsSpacing),
//                   buildHeader(
//                     context,
//                     subtitle: "group 1",
//                     title: "group 2",
//                   ),
//                   SizedBox(height: AppDimensions.mediumSpacing),
//                   _buildFundsHardcoded(widget.buildFunds),
//                   SizedBox(height: AppDimensions.mediumSpacing),
//                   _buildCharts(theme, context, widget.buildCharts),
//                   _buildFunds(context, widget.fundsList),
//                 ],
//               ),
//             )),
//       ),
//     ),
//   );
