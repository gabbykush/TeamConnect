import 'package:cloud_firestore/cloud_firestore.dart';
import 'collections.dart';

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

  //Streams
  //Account
  Stream<Account> get account {
    return accountCollection
        .document(uid)
        .snapshots()
        .map(_accountListFromSnapshot);
  }

  //Profile
  Stream<Profile> get profile {
    return profileCollection
        .document(uid)
        .snapshots()
        .map(_profileListFromSnapshot);
  }

  //-------------------------------------------------------------

  //Get Documents
  //Account
  Account _accountListFromSnapshot(DocumentSnapshot snapshot) {
    return Account(
      uid: uid,
      firstName: snapshot.data["firstName"] ?? '',
      lastName: snapshot.data["lastName"] ?? '',
      phone: snapshot.data["phone"] ?? 0,
    );
  }

  //Profle
  Profile _profileListFromSnapshot(DocumentSnapshot snapshot) {
    return Profile(
      uid: uid,
      imageUrl: snapshot.data['imageUrl'] ?? 'Insert image here',
      institution: snapshot.data['institution'] ?? '',
      major: snapshot.data['major'] ?? '',
      year: snapshot.data['year'] ?? '',
      birthLoc: snapshot.data['birthLocation'] ?? '',
      currentLoc: snapshot.data['currentLocation'] ?? '',
    );
  }

//-------------------------------------------------------------

//check if profile document exists
  Future<bool> checkIfProfileExists() async {
    bool exists;
    try {
      await profileCollection.document(uid).get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }
}
