import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyFirebaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn =
      kIsWeb
          ? GoogleSignIn(
            clientId:
                "878015482310-1atr2srvnh4eh2198kq8ngotkk9ed1qc.apps.googleusercontent.com",
            scopes: ['email'],
          )
          : GoogleSignIn();

  // 📌 Register with Email & Password
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("Error in registration: $e");
      return null;
    }
  }

  // 📌 Login with Email & Password
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error in login: $e");
      return null;
    }
  }

  // 📌 Login with Google
  Future<User?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled sign-in

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      return userCredential.user;
    } catch (e) {
      print("Error in Google login: $e");
      return null;
    }
  }

  // 📌 Logout
  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  // 📌 Get Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
