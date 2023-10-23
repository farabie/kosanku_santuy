part of 'services.dart';

class AuthServices {
  static final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<SignInSignUpResult> signUp(
      String email, String password, String fullName) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.convertToUser(
        fullName: fullName,
      );

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      final errorParts = e.toString().split(',');
      if (errorParts.length > 1) {
        return SignInSignUpResult(message: errorParts[1]);
      } else {
        return SignInSignUpResult(message: e.toString());
      }
    }
  }
}

class SignInSignUpResult {
  final User? user;
  final String? message;

  SignInSignUpResult({this.user, this.message});
}
