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

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return User(
      id,
      data?['email'] ?? "",
      fullName: data?['fullName'] ?? "",
    );
  }
}
