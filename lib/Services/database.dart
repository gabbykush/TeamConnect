import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  //Account
  final CollectionReference accountCollection =
      Firestore.instance.collection('Account');
  //Profile
  final CollectionReference profileCollection =
      Firestore.instance.collection('Profile');

  //-------------------------------------------------------------

  //database updates
  //Account Table Update
  Future updateAccountData(String firstName, String lastName, int phone) async {
    return await accountCollection.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
    });
  }

  //Profile Table Update
  Future updateProfileData(String imageUrl, String institution, String major,
      String year, String birthLoc, String currentLoc) async {
    return await profileCollection.document(uid).setData({
      'imageUrl': imageUrl,
      'institution': institution,
      'major': major,
      'year': year,
      'birthLocation': birthLoc,
      'currentLocation': currentLoc,
    });
  }

  //-------------------------------------------------------------

  //Profile
  Future getData() async {
    profileCollection.document().get();
  }
}
