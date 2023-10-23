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

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = await result.fromFireStore();
      return SignInSignUpResult(user: user);
    } catch (e) {
      String errorMessage = 'Email dan Password Salah Coba Masukan Lagi';
      if (e is auth.FirebaseAuthException) {
        if (e.code == 'firebase_auth/INVALID_LOGIN_CREDENTIALS') {
          errorMessage =
              "Kredensial login tidak valid. Periksa email dan kata sandi Anda.";
        }
      }
      return SignInSignUpResult(message: errorMessage);
    }
  }
}

class SignInSignUpResult {
  final User? user;
  final String? message;

  SignInSignUpResult({this.user, this.message});
}
