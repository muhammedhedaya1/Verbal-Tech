import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:help_me_talk/core/services/database.dart';
import 'package:help_me_talk/view/home/homescreen.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // The user canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential result = await auth.signInWithCredential(credential);
      User? userDetails = result.user;

      if (userDetails != null) {
        if (userDetails.displayName == null || userDetails.displayName!.isEmpty) {
          await userDetails.updateProfile(displayName: googleSignInAccount.displayName);
          await userDetails.reload();
          userDetails = auth.currentUser;
        }

        Map<String, dynamic> userInfoMap = {
          "email": userDetails?.email,
          "name": userDetails?.displayName,
          "imgUrl": userDetails?.photoURL,
          "id": userDetails?.uid,
        };

        await DatabaseMethods().addUser(userDetails!.uid, userInfoMap).then(
              (value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(context, _getErrorMessage(e.code));
    } catch (e) {
      _showErrorDialog(context, 'An error occurred. Please try again.');
    }
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different credential.';
      case 'invalid-credential':
        return 'The credential provided is invalid.';
      case 'user-disabled':
        return 'The user has been disabled.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      default:
        return 'An error occurred. Please try again.';
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
