import 'dart:async';

import 'package:challengesnowman/app/modules/models/spot_model.dart';
import 'package:challengesnowman/app/services/firebase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobx/mobx.dart';

part 'tab_map_controller.g.dart';

class TabMapController = _TabMapBase with _$TabMapController;

abstract class _TabMapBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String markerIdSelected;

  @observable
  Set<Marker> listMarkers = Set();

  @observable
  List<SpotModel> listSpots = List();

  @observable
  GoogleMapController _mapController;

  @observable
  bool showScrollableBottom = false;

  @observable
  LatLng positionAtual;

  final fireStoreProvider = FirebaseProvider();

  @action
  setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  @action
  setShowScrollableButton(value) {
    showScrollableBottom = value;
  }

  @action
  movePosition(lat, long) {
    _mapController
        .moveCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 12));
  }

  @action
  showLoading(bool value) {
    isLoading = value;
  }

  _getMarkerPosition(SpotModel spot) async {
    return LatLng(
      spot.lat,
      spot.long,
    );
  }

  @action
  setMarkers(markers) {
    listMarkers.addAll(markers);
  }

  @action
  getSpotsByDesc(String desc) async {
    listSpots = [];
    await fireStoreProvider.getSpotsByDesc(desc).then((value) async {
      listSpots.addAll(value);
    });
    return listSpots;
  }

  @action
  populateSpots() async {
    showLoading(true);
    Set<Marker> markers = Set();
    await fireStoreProvider.getSpots().then((value) async {
      for (int i = 0; i < value.length; i++) {
        Marker marker = Marker(
          markerId:
              MarkerId(value[i].long.toString() + value[i].lat.toString()),
          position: await _getMarkerPosition(value[i]),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            HSVColor.fromColor(
              Hexcolor(value[i].pinColor),
            ).hue,
          ),
          onTap: () {
            markerIdSelected = value[i].id;
            showScrollableBottom = true;
          },
        );
        markers.add(marker);
      }
      setMarkers(markers);
      showLoading(false);
    });
  }
}
