import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:teamconnect/Authentication/auth.dart';
import 'package:teamconnect/Services/collections.dart';
import 'package:teamconnect/Services/database.dart';
import 'package:teamconnect/Widgets/image_picker.dart';

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String profilePic = '';
  String institution = '';
  String major = '';
  String year = '';
  String birthLoc = '';
  String currentLoc = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<Object>(
        stream: DatabaseService(uid: user.uid).profile,
        builder: (context, snapshot) {
          Profile profile = snapshot.data;

          profilePic = profile.imageUrl != ''
              ? profile.imageUrl
              : 'lib/assets/icon-profile-22.jpg';
          institution = profile.institution;
          major = profile.major;
          year = profile.year;
          birthLoc = profile.birthLoc;
          currentLoc = profile.currentLoc;

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(profilePic),
                          height: 100,
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: RaisedButton(
                            onPressed: () async {
                              try {
                                profilePic = await ImagePicker()
                                    .getImage(source: ImageSource.gallery)
                                    .toString();
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text('Pick a new pic'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  profilePadding(
                    TextFormField(
                      decoration: profileDecoration("Institution"),
                      // validator: (val) {
                      //   return val.isEmpty ? "Enter a new Institution" : null;
                      // },
                      onChanged: (value) => institution = value,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: profileDecoration("Major"),
                            // validator: (val) {
                            //   return val.isEmpty ? "Enter a new Major" : null;
                            // },
                            onChanged: (value) => major = value,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: profileDecoration("Year"),
                            // validator: (val) {
                            //   return val.isEmpty ? "Enter a new Year" : null;
                            // },
                            onChanged: (value) => year = value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  profilePadding(
                    TextFormField(
                      decoration: profileDecoration("Birth Place"),
                      // validator: (val) {
                      //   return val.isEmpty ? "Enter a new birth place" : null;
                      // },
                      onChanged: (value) => birthLoc = value,
                    ),
                  ),
                  profilePadding(
                    TextFormField(
                      decoration: profileDecoration("Current Location"),
                      // validator: (val) {
                      //   return val.isEmpty
                      //       ? "Enter a new current location"
                      //       : null;
                      // },
                      onChanged: (value) => currentLoc = value,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid)
                              .updateProfileData(profilePic, institution, major,
                                  year, birthLoc, currentLoc);
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Update'),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

Padding profilePadding(TextFormField textFormField) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: textFormField,
  );
}

InputDecoration profileDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  );
}
