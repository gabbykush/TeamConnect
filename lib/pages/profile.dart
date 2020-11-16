import 'package:flutter/material.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/Widgets/bottom_nav_bar.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:teamconnect/general/resources/font_styles.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();

  String error = '';

  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[50],
        bottomNavigationBar: BottomNavigationConnect(index: 3),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
              top: AppDimensions.defaultPadding,
              left: AppDimensions.defaultPadding,
              right: AppDimensions.defaultPadding),
          child: Column(
            children: [
              Container(
                child: Column(children: [
                  //Profile Pic
                  Container(
                      margin: EdgeInsets.only(top: 50, bottom: 10),
                      child: Center(child: Text("Profile Picture")),
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black))),
                  //First Name, Last Name
                  Text("FirstName LastName",
                      style: TextStyle(fontSize: 30, color: Colors.black)),
                  //Change Profile Settings Button
                  TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.settings,
                        color: Colors.black,
                      )),
                ]),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //About Me
                          Text(
                            "ABOUT ME",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(""),
                          //Institution
                          Text("New York Institue of Technology"),
                          //Major, Year
                          Text("Computer Science BS, 4th Year"),
                          //Born In
                          Text("Born in New York City"),
                          //Lives In
                          Text("Lives in New York City"),
                        ]),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Container(
                    height: 80,
                    child: Row(
                      children: [
                        //Email
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.mail),
                              Text("sample@nyit.edu"),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone),
                              Text("Phone #"),
                            ],
                          ),
                        )
                        //Phone number
                      ],
                    )),
              ),
              RaisedButton(
                onPressed: () async {
                  dynamic result = _auth.signOut();
                },
                color: Colors.yellow[600],
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )));
  }
}
