import 'dart:convert';
import 'dart:core';

import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  UserModel _user = null;
  final PublishSubject _isSessionValid = PublishSubject<bool>();

  Stream get isSessionValid => _isSessionValid.stream;
  void dispose() {
    _isSessionValid.close();
  }

  void openSession(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", json.encode(user));
    _user = user;
    _isSessionValid.sink.add(true);
  }

  void closeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
    _isSessionValid.sink.add(false);
  }

  getUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _user = UserModel.fromJson(jsonDecode(prefs.get("user")));
    if (_user != null) {
      return _user;
    }
  }
}

final sharedPreferences = SharedPreferencesService();
