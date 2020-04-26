import 'dart:async';
import 'package:challengesnowman/app/modules/login/components/toast.dart';
import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:challengesnowman/app/services/firebase_provider.dart';
import 'package:challengesnowman/app/services/shared_preferences_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';

class Auth {
  FacebookLogin _facebookLogin = FacebookLogin();
  final fireStoreProvider = FirebaseProvider();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<AuthResult> signInAnonymously() async {
    AuthResult auth = await firebaseAuth.signInAnonymously();

    return auth;
  }

  signInFacebook() async {
    try {
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
              isAnonymous: auth.user.isAnonymous);

          await validUser(firebaseUser: auth.user, user: user);
          break;
        case FacebookLoginStatus.cancelledByUser:
          print("Facebook login cancelled");
          throw ("Facebook login cancelled");
          break;
        case FacebookLoginStatus.error:
          print(result.errorMessage);
          throw ("Facebook login cancelled");
          break;
      }
      return user;
    } catch (e) {
      throw (e);
    }
  }

  signUpFacebook() async {
    try {
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
              isAnonymous: auth.user.isAnonymous);
          bool result = await checkUserExist(user.email);
          if (!result) {
            await fireStoreProvider.addUser(user);
          }
          break;
        case FacebookLoginStatus.cancelledByUser:
          Toast("Login", "Facebook login cancelled", "falha").getSnack();
          break;
        case FacebookLoginStatus.error:
          Toast("Login", result.errorMessage, "falha").getSnack();
          throw ("Facebook login cancelled");
          break;
      }
      return user;
    } catch (e) {
      throw (e);
    }
  }

  signUpFacebookConfirm(UserModel user) async {
    try {} catch (e) {
      throw (e);
    }
  }

  validUser({FirebaseUser firebaseUser, UserModel user}) async {
    bool result = await checkUserExist(user.email);
    if (!result) {
      throw ("Usuário não encontrado, por favor cadastra-se");
    }
  }

  void signOut() async {
    _facebookLogin.logOut();
    firebaseAuth.signOut();
    sharedPreferences.closeSession();
    Get.offNamed("/login");
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
