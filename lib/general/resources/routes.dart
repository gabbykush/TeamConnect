import 'package:flutter/material.dart';
import 'package:teamconnect/pages/events.dart';
import 'package:teamconnect/pages/homepage.dart';
import 'package:teamconnect/pages/profile.dart';
import 'package:teamconnect/pages/food/restaurant.dart';

class Routes {
  Routes._();
  static const String groupTab = '/homepage';
  static const String eventsTab = '/events';
  static const String foodTab = '/restaurant';
  static const String profileTab = '/profile';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      groupTab: (context) => GroupPage(),
      eventsTab: (context) => EventPage(),
      foodTab: (context) => FoodTabPage(),
      profileTab: (context) => ProfilePage(),
    };
  }
}
