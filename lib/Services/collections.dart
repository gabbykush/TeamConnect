//Profile
class Profile {
  final String uid;
  final String imageUrl;
  final String institution;
  final String major;
  final String year;
  final String birthLoc;
  final String currentLoc;

  Profile(
      {this.uid,
      this.imageUrl,
      this.institution,
      this.major,
      this.year,
      this.birthLoc,
      this.currentLoc});
}

class Account {
  final String uid;
  final String firstName;
  final String lastName;
  final int phone;

  Account({this.uid, this.firstName, this.lastName, this.phone});
}
