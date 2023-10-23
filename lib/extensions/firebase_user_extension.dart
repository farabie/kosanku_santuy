part of 'extensions.dart';

extension FirebaseUserExtension on auth.UserCredential {
  User convertToUser({String fullName = "No Name"}) =>
      User(user!.uid, user!.email!, fullName: fullName);

  Future<User> fromFireStore() async => await UserServices.getUser(user!.uid);
}
