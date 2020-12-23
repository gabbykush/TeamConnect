import 'package:flutter/material.dart';
import 'package:teamconnect/pages/events.dart';
import 'package:teamconnect/pages/food/restaurant.dart';
import 'package:teamconnect/pages/homepage.dart';
import 'package:teamconnect/pages/login.dart';
import 'package:teamconnect/pages/messenger.dart';
import 'package:teamconnect/pages/profile.dart';
import 'package:teamconnect/pages/profilecreation.dart';
import 'package:teamconnect/pages/profilesettings.dart';
import 'package:teamconnect/pages/register.dart';

class Routes {
  Routes._();
  static const String groupTab = '/homepage';
  static const String eventsTab = '/events';
  static const String foodTab = '/restaurant';
  static const String profileTab = '/profile';
  static const String login = '/login';
  static const String register = "/register";
  static const String profileSettings = "/profilesettings";
  static const String profileCreation = "/profileCreation";
  static const String chatScreen = '/messenger';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      groupTab: (context) => GroupPage(),
      eventsTab: (context) => EventPage(),
      foodTab: (context) => FoodTabPage(),
      profileTab: (context) => ProfilePage(),
      chatScreen: (context) => ChatScreen(),
      login: (context) => Login(),
      register: (context) => Register(),
      profileSettings: (context) => ProfileSettings(),
      profileCreation: (context) => ProfileCreation(),
    };
  }
}
