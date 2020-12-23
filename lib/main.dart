import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/Authentication/authprovider.dart';
import 'package:teamconnect/general/resources/app_themes.dart';
import 'package:teamconnect/general/resources/font_styles.dart';
import 'package:teamconnect/login_success_test.dart';
import 'package:teamconnect/loginpage.dart';
import 'package:teamconnect/models/user_model.dart';
import 'package:teamconnect/pages/login.dart';
import 'package:teamconnect/pages/profile.dart';
import 'package:teamconnect/pages/register.dart';
import 'package:teamconnect/registerpage.dart';
import 'package:teamconnect/startpage.dart';
import 'package:teamconnect/pages/homepage.dart';
import 'package:teamconnect/providers/general.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Widgets/loading_screen.dart';
import 'general/resources/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  final Future<FirebaseApp> defaultApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    var generalProvider = Provider.of<General>(context);
    _appContext = context;
    return FutureBuilder(
      future: defaultApp,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<auth.User>.value(
              value: AuthService().user,
              builder: (context, userSnapshot) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    canvasColor:
                        generalProvider.activeThemeData.secondarySwatch(),
                    fontFamily: defaultFontFamily,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  routes: Routes.getRoutes(),
                  home: AuthProvider(),
                  // initialRoute: Routes.groupTab,
                );
              });
        }
        return MaterialApp(home: LoadingScreen());
      },
    );
  }
}

getProviders() {
  return [
    ChangeNotifierProvider(create: (_) => General()),
  ];
}

//Stefan Main

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:teamconnect/general/resources/font_styles.dart';
// import 'package:teamconnect/providers/general.dart';

// import 'Widgets/bottom_nav_bar.dart';
// import 'general/resources/routes.dart';

// void main() {
//   runApp(MultiProvider(
//     providers: getProviders(),
//     child: MyApp(),
//   ));
// }

// BuildContext appContext() {
//   return _appContext;
// }

// BuildContext _appContext;

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var generalProvider = Provider.of<General>(context);
//     _appContext = context;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         canvasColor: generalProvider.activeThemeData.secondarySwatch(),
//         fontFamily: defaultFontFamily,
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//       ),
//       routes: Routes.getRoutes(),
//       home: BottomNavigationConnect(),
//       // initialRoute: Routes.groupTab,
//     );
//   }
// }

// getProviders() {
//   return [
//     ChangeNotifierProvider(create: (_) => General()),
//   ];
// }

// GABRIEL's MAIN

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:teamconnect/Authentication/auth.dart';
// import 'package:teamconnect/Authentication/authprovider.dart';
// import 'package:teamconnect/general/resources/app_themes.dart';
// import 'package:teamconnect/general/resources/font_styles.dart';
// import 'package:teamconnect/login_success_test.dart';
// import 'package:teamconnect/loginpage.dart';
// import 'package:teamconnect/pages/login.dart';
// import 'package:teamconnect/pages/profile.dart';
// import 'package:teamconnect/pages/register.dart';
// import 'package:teamconnect/registerpage.dart';
// import 'package:teamconnect/startpage.dart';
// import 'package:teamconnect/pages/homepage.dart';
// import 'package:teamconnect/providers/general.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'Widgets/loading_screen.dart';
// import 'general/resources/routes.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final Future<FirebaseApp> defaultApp = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     // var generalProvider = Provider.of<General>(context);
//     return FutureBuilder(
//       future: defaultApp,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return StreamProvider<User>.value(
//               value: AuthService().user,
//               builder: (context, userSnapshot) {
//                 return MaterialApp(
//                   debugShowCheckedModeBanner: false,
//                   theme: ThemeData(
//                     primaryColor: Colors.yellow[600],
//                     canvasColor: Colors.cyan[50],
//                   ),
//                   routes: Routes.getRoutes(),
//                   home: AuthProvider(),
//                   // initialRoute: Routes.groupTab,
//                 );
//               });
//         }
//         return MaterialApp(home: LoadingScreen());
//       },
//     );
//   }
// }
