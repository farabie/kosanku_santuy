part of 'services.dart';

class UserServices {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'fullName': user.fullName,
    });
  }
}
