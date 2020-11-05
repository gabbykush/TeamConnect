import 'package:flutter/material.dart';
import 'package:teamconnect/pages/homepage.dart';

class Routes {
  Routes._();
  static const String groupTab = '/homepage';
  static const String eventTab = '/health-tab';
  static const String foodTab = '/unit_link';
  static const String profileTab = '/more-tab';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      groupTab: (context) => GroupPage(),
      // eventTab: (context) => UnitLinkTopUp(),
      // foodTab: (context) => UnitLinkPortfolio(),
      // profileTab: (context) => UnitLinkUpdateSettings(),
    };
  }
}
