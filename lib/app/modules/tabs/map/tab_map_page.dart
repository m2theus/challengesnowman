import 'dart:async';

import 'package:challengesnowman/app/modules/tabs/map/components/searchbox.dart';
import 'package:challengesnowman/app/modules/tabs/map/tab_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class TabMapPage extends StatefulWidget {
  @override
  _TabMapPageState createState() => _TabMapPageState();
}

class _TabMapPageState extends State<TabMapPage> {
  final Completer<GoogleMapController> _mapController = Completer();
  LatLng _positionAtual;
  final _tabMapController = Provider.of<TabMapController>(Get.context);

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController.complete(controller);
    await _getUserPosition();
  }

  _getUserPosition() async {
    return await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  @override
  void initState() {
    _tabMapController.showLoading(true);
    super.initState();
    _getUserPosition().then((value) {
      _positionAtual = LatLng(
        value.latitude,
        value.longitude,
      );
      _tabMapController.showLoading(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: Observer(
      builder: (_) {
        return _tabMapController.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: (GoogleMapController controller1) async {
                      _mapController.complete(controller1);
                    },
                    mapToolbarEnabled: false,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: _positionAtual,
                      zoom: 15,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 0,
                    right: 0,
                    child: SearchBox(
                    ),
                  ),
                ],
              );
      },
    ));
  }
}
