// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:fruitshup/core/errors/custom_exceptions.dart';
// import 'package:fruitshup/generated/l10n.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class FirebaseAuthService {
//   Future <void> deleteUser() async {
//     await FirebaseAuth.instance.currentUser!.delete();
//   }
//   Future<User> createUserWithEmailAndPassword(
//       {required String email, required String password}) async {
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return credential.user!;
//     } on FirebaseAuthException catch (e) {
//       log("Exception in firebase authService in createUserWithEmailAndPassword: ${e.toString()} and ${e.code}");
//       if (e.code == 'weak-password') {
//         //
//         throw CustomExceptions(message: S.current.weak_password);
//       } else if (e.code == 'email-already-in-use') {
//         // log('The account already exists for that email.');
//         throw CustomExceptions(message: S.current.email_already_in_use);
//       } else if (e.code == 'network-request-failed') {
//         throw CustomExceptions(message: S.current.internet_con);
//       } else {
//         throw CustomExceptions(message: S.current.an_error_occurred);
//       }
//     } catch (e) {
//       // print(e);
//       log("Exception in firebase authService in createUserWithEmailAndPassword: ${e.toString()}");
//       //
//       throw CustomExceptions(message: S.current.an_error_occurred);
//     }
//   }

//   Future<User> signInWithEmailAndPassord(
//       {required String email, required String password}) async {
//     try {
//       final credintial = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);

//       return credintial.user!;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         throw CustomExceptions(message: "user not found");
//       }
//       else if (e.code == "invalid-credential") {
//         throw CustomExceptions(message: S.current.email_or_password);
//       } else if (e.code == 'network-request-failed') {
//         throw CustomExceptions(message: S.current.internet_con);
//       } else if (e.code == 'too-many-requests') {
//         // throw CustomExceptions(message: S.current.too_many_requests);
//         throw CustomExceptions(message: "test");

//       } else if (e.code == 'invalid-email') {
//         // throw CustomExceptions(message: S.current.invalid_email);
//         throw CustomExceptions(message: "test");
//       } else {
//         throw CustomExceptions(message: "Authentication error: ${e.code}");
//       }
//     } catch (e) {
//       log("Exception in firebase authService log in in createUserWithEmailAndPassword: ${e.toString()}");

//       // print(e);
//       //
//       throw CustomExceptions(message: S.current.an_error_occurred);
//     }
//   }

//   Future<User> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//     return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
//   }
// Future<User> signInWithFacebook() async {
//   final LoginResult loginResult = await FacebookAuth.instance.login();

//   final OAuthCredential facebookAuthCredential =
//       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

//   return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
// }
// bool isLoggedIn()  {
//   final user = FirebaseAuth.instance.currentUser;
//   return user != null;
// }
// }


