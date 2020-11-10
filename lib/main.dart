import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/general/resources/font_styles.dart';
import 'package:teamconnect/login_success_test.dart';
import 'package:teamconnect/loginpage.dart';
import 'package:teamconnect/registerpage.dart';
import 'package:teamconnect/startpage.dart';
import 'package:teamconnect/pages/homepage.dart';
import 'package:teamconnect/providers/general.dart';

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
      home: GroupPage(),
      // initialRoute: Routes.groupTab,
    );
  }
}
