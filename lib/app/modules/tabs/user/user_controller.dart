import 'dart:async';

import 'package:challengesnowman/app/modules/login/components/toast.dart';
import 'package:challengesnowman/app/modules/models/spot_model.dart';
import 'package:challengesnowman/app/services/authorization.dart';
import 'package:challengesnowman/app/services/firebase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  bool isLoading = false;

  @observable
  List<SpotModel> listSpots = List();

  final fireStoreProvider = FirebaseProvider();

  final _auth = Auth();

  @action
  showLoading(bool value) {
    isLoading = value;
  }

  logout() {
    _auth.signOut();
  }
}
