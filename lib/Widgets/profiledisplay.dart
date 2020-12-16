import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/Forms/profileform.dart';
import 'package:teamconnect/Services/collections.dart';
import 'package:teamconnect/Services/database.dart';
import 'package:teamconnect/Widgets/loading_screen.dart';
import 'package:teamconnect/general/resources/routes.dart';
import 'package:teamconnect/pages/profilesettings.dart';

class ProfileDisplay extends StatefulWidget {
  @override
  _ProfileDisplayState createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  @override
  Widget build(BuildContext context) {
    //Profile Table
    //final profileList = Provider.of<List<Profile>>(context);
    final user = Provider.of<User>(context);
    final _auth = AuthService();

    String profilePic = 'lib/assets/icon-profile-22.jpg';

    return Column(
      children: [
        Container(
          child: Column(children: [
            //Profile Pic
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 10),
              child: Center(
                child: Image(
                  image: AssetImage(profilePic),
                ),
              ),
              width: 150,
              height: 100,
            ),
            //First Name, Last Name
            GetName(),
            //Change Profile Settings Button
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.profileSettings);
                },
                child: Icon(
                  Icons.settings,
                  color: Colors.black,
                )),
          ]),
        ),
        ProfileCard(),
        AccountCard(),
        RaisedButton(
          onPressed: () async {
            LoadingScreen();
            Navigator.popUntil(context, (route) => route.isFirst);
            _auth.signOut();
          },
          color: Colors.yellow[600],
          child: Text(
            "Log Out",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
    ;
  }
}

//-------------------------------------------------------

class GetName extends StatefulWidget {
  @override
  _GetNameState createState() => _GetNameState();
}

class _GetNameState extends State<GetName> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<Object>(
        stream: DatabaseService(uid: user.uid).account,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Account userAccount = snapshot.data;
            return Text(userAccount.firstName + ' ' + userAccount.lastName,
                style: TextStyle(fontSize: 30, color: Colors.black));
          }
          return Text("");
        });
  }
}

//----------------------------------------------------------

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<Object>(
        stream: DatabaseService(uid: user.uid).profile,
        builder: (context, snapshot) {
          Profile profile;

          if (snapshot.hasData) {
            profile = snapshot.data;

            return Card(
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
                        Text(profile.institution),
                        //Major, Year
                        Text(profile.major + ', ' + profile.year),
                        //Born In
                        Text("Born in " + profile.birthLoc),
                        //Lives In
                        Text("Lives in " + profile.currentLoc),
                      ]),
                ),
              ),
            );
          }
          return Card();
        });
  }
}

//---------------------------------------------------------

class AccountCard extends StatefulWidget {
  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  final _auth = AuthService();
  Future<String> email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = _auth.getEmail();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<Object>(
        stream: DatabaseService(uid: user.uid).account,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Account account = snapshot.data;
            return FutureBuilder<String>(
                future: email,
                builder: (context, emailSnapshot) {
                  return Card(
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
                                  emailSnapshot.hasData
                                      ? Text(emailSnapshot.data)
                                      : Text("no email?"),
                                ],
                              ),
                            ),
                            //Phone Number
                            Container(
                              margin: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone),
                                  Text(account.phone.toString()),
                                ],
                              ),
                            )
                            //Phone number
                          ],
                        )),
                  );
                });
          }
          return Card();
        });
  }
}

//----------------------------------------------------
