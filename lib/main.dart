import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/general/resources/font_styles.dart';
import 'package:teamconnect/providers/general.dart';

import 'Widgets/bottom_nav_bar.dart';
import 'general/resources/routes.dart';

void main() {
  runApp(MultiProvider(
    providers: getProviders(),
    child: MyApp(),
  ));
}

BuildContext appContext() {
  return _appContext;
}

BuildContext _appContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var generalProvider = Provider.of<General>(context);
    _appContext = context;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: generalProvider.activeThemeData.secondarySwatch(),
        fontFamily: defaultFontFamily,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      routes: Routes.getRoutes(),
      home: BottomNavigationConnect(),
      // initialRoute: Routes.groupTab,
    );
  }
}

getProviders() {
  return [
    ChangeNotifierProvider(create: (_) => General()),
  ];
}
