import 'package:firebase_auth/firebase_auth.dart';
import 'package:teamconnect/Services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Stream<String> get onAuthStateChanged {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);
  }

  Future getUid() async {
    FirebaseUser user = await _auth.currentUser();
    return user.uid;
  }

  //login
  Future login(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future register(String email, String password, String firstName,
      String lastName, int phone) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      DatabaseService(uid: user.uid)
          .updateAccountData(firstName, lastName, phone);
      //DatabaseService(uid: user.uid).updateProfileData("", "", "", "", "", "");
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Log out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> getEmail() async {
    String email;
    await _auth.currentUser().then((value) => email = value.email);
    return email;
  }

  Future<bool> isVerified() async {
    bool verified;
    await _auth.currentUser().then((value) => verified = value.isEmailVerified);
    return verified;
  }
}

class User {
  final String uid;
  User({this.uid});
}
