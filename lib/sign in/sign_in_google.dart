import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Now, we will need to create an instance of FirebaseAuth & GoogleSignIn .

//
// import 'package:flutter/material.dart';
//
//
// class GoogleSignInProvider extends ChangeNotifier {
//   final googleSignIn = GoogleSignIn();
//   bool _isSigningIn;
//
//   GoogleSignInProvider() {
//     _isSigningIn = false;
//   }
//
//   bool get isSigningIn => _isSigningIn;
//
//   set isSigningIn(bool isSigningIn) {
//     _isSigningIn = isSigningIn;
//     notifyListeners();
//   }
//
//   Future login() async {
//     isSigningIn = true;
//
//     final user = await googleSignIn.signIn();
//     if (user == null) {
//       isSigningIn = false;
//       return;
//     } else {
//       final googleAuth = await user.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       await FirebaseAuth.instance.signInWithCredential(credential);
//
//       isSigningIn = false;
//     }
//   }
//
//   void logout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }
// }

//

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;


//
// Then, create two methods:
//
// signInWithGoogle
// signOutGoogle

Future<String> signInWithGoogle() async {

  await Firebase.initializeApp();


  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    // if (name.contains(" ")) {
    //   name = name.substring(0, name.indexOf(" "));
    // }

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString('email', email);
prefs.setString('name', name);
prefs.setString('imageUrl', imageUrl);


    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}








void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Signed Out");
}