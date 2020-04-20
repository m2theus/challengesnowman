import 'dart:async';
import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:challengesnowman/app/services/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

//enum authProblems { UserNotFound, PasswordNotValid, NetworkError, UnknownError }

class Auth {
  FacebookLogin _facebookLogin = FacebookLogin();
  final fireStoreProvider = FirebaseProvider();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  signInFacebook() async {
    var result = await _facebookLogin.logIn(['email', 'public_profile']);
    var credential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token);
    AuthResult auth;
    UserModel user;

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        auth = await firebaseAuth.signInWithCredential(credential);

        user = UserModel(
          fullName: auth.user.displayName,
          email: auth.user.email,
          photoUrl: auth.user.photoUrl,
          uid: auth.user.uid,
        );

        checkExistUser(firebaseUser: auth.user, user: user);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("Facebook login cancelled");
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
    return user;
//    FirebaseUser user = await FirebaseAuth.instance
//        .signInWithEmailAndPassword(email: email, password: password);
//    return user.uid;
  }

  signUpFacebook() async {
    AuthResult auth;

    await _facebookLogin.logIn(['email', 'public_profile']).then((value) async {
      AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: value.accessToken.token);
      auth = await firebaseAuth.signInWithCredential(credential);
    });
    return auth;
  }

  checkExistUser({FirebaseUser firebaseUser, UserModel user}) async {
    await fireStoreProvider.database
        .collection('users')
        .getDocuments()
        .then((docs) async {
      if (docs.documents.isEmpty) {
        fireStoreProvider.addUser(user);
      } else {
        bool result = await checkUserExist(user.email);
        if (result) {
          fireStoreProvider.addUser(user);
        }
      }
    });
  }

  static Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  static Future<FirebaseUser> getCurrentFirebaseUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  Future<bool> checkUserExist(String email) async {
    bool exists = false;
    try {
      await Firestore.instance.document("users/$email").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }
}
