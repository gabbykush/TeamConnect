import 'package:flutter/material.dart';
import 'package:teamconnect/general/resources/font_styles.dart';

import 'Widgets/bottom_nav_bar.dart';
import 'general/resources/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var generalProvider = Provider.of<General>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: defaultFontFamily,
        // canvasColor: generalProvider.activeThemeData.secondarySwatch(),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      routes: Routes.getRoutes(),
      home: BottomNavigationConnect(),
      // initialRoute: Routes.groupTab,
    );
  }
}
