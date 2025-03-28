import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:chatbot/core/errors/custom_exception.dart';
import 'package:chatbot/generated/l10n.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in firebase authService in createUserWithEmailAndPassword: ${e.toString()} and ${e.code}");
      if (e.code == 'weak-password') {
        //
        throw CustomExceptions(message: S.current.weak_password);
      } else if (e.code == 'email-already-in-use') {
        // log('The account already exists for that email.');
        throw CustomExceptions(message: S.current.email_already_exists);
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: S.current.internet_con);
      } else {
        throw CustomExceptions(message: S.current.an_error_occurred);
      }
    } catch (e) {
      // print(e);
      log("Exception in firebase authService in createUserWithEmailAndPassword: ${e.toString()}");
      //
      throw CustomExceptions(message: S.current.an_error_occurred);
    }
  }

  Future<User> signInWithEmailAndPassord(
      {required String email, required String password}) async {
    try {
      final credintial = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return credintial.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomExceptions(message: "user not found");
      } else if (e.code == "invalid-credential") {
        throw CustomExceptions(message: S.current.email_or_password);
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: S.current.internet_con);
      } else if (e.code == 'too-many-requests') {
        // throw CustomExceptions(message: S.current.too_many_requests);
        throw CustomExceptions(message: "test");
      } else if (e.code == 'invalid-email') {
        // throw CustomExceptions(message: S.current.invalid_email);
        throw CustomExceptions(message: "test");
      } else {
        throw CustomExceptions(message: "Authentication error: ${e.code}");
      }
    } catch (e) {
      log("Exception in firebase authService log in in createUserWithEmailAndPassword: ${e.toString()}");

      // print(e);
      //
      throw CustomExceptions(message: S.current.an_error_occurred);
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final LoginResult loginResult = await FacebookAuth.instance.login(
      nonce: nonce,
    );

    OAuthCredential facebookAuthCredential;

    if (Platform.isIOS) {
      switch (loginResult.accessToken!.type) {
        case AccessTokenType.classic:
          final token = loginResult.accessToken as ClassicToken;
          facebookAuthCredential = FacebookAuthProvider.credential(
            token.authenticationToken!,
          );
          break;
        case AccessTokenType.limited:
          final token = loginResult.accessToken as LimitedToken;
          facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce,
          );
          break;
      }
    } else {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    }

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  bool isLoggedIn() {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential))
        .user!;
  }
}
