import 'dart:async';

import 'package:challengesnowman/app/modules/login/components/toast.dart';
import 'package:challengesnowman/app/modules/models/spot_model.dart';
import 'package:challengesnowman/app/services/authorization.dart';
import 'package:challengesnowman/app/services/firebase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobx/mobx.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  @observable
  bool isLoading = false;

  @observable
  List<SpotModel> listSpots = List();

  final fireStoreProvider = FirebaseProvider();

  @action
  showLoading(bool value) {
    isLoading = value;
  }

  @action
  getSpotsFavorites() async {
    try {
      showLoading(true);
      await fireStoreProvider.getSpotsFavorites().then((value) async {
        listSpots = value;
        showLoading(false);
      });
    } catch (e) {
      showLoading(false);
      Toast("Erro ao buscar spots", e, "falha").getSnack();
    }
  }
}
