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

  static Future<SignInSignUpResult> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return SignInSignUpResult(message: "Login dengan Google dibatalkan");
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final auth.UserCredential result =
          await _auth.signInWithCredential(credential);
      final String fullName = googleUser.displayName ?? "No Name";

      final User user = result.convertToUser(fullName: fullName);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: "Gagal masuk dengan Google: $e");
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  //Fungsi Untuk Token nantinya
  static Stream<auth.User?> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  final User? user;
  final String? message;

  SignInSignUpResult({this.user, this.message});
}
