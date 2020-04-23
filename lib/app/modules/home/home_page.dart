import 'dart:async';

import 'package:challengesnowman/app/modules/tabs/map/tab_map_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;
  final int index;
  const HomePage({Key key, this.title = "Home", this.index = 1
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  final Key _mapKey = UniqueKey();
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.index,
        length: 3,
        child: new Scaffold(
          body: Container(
            child: TabBarView(
              physics:  NeverScrollableScrollPhysics(),
              children: [
                new Container(
                  color: Colors.yellow,
                ),
                new Container(
                  child: TabMapPage(key:_mapKey),
                ),
                new Container(
                  color: Colors.lightGreen,
                ),
              ],
            ),
//          GoogleMap(
//            onMapCreated: _onMapCreated,
//            initialCameraPosition: CameraPosition(
//              target: _center,
//              zoom: 11.0,
//            ),
//          ),
          ),
          bottomNavigationBar: new TabBar(
            dragStartBehavior: DragStartBehavior.down,
            isScrollable: false,
            tabs: [
              Tab(
                icon: new Icon(Icons.star,size: 35,),
              ),
              Tab(
                icon: new Icon(Icons.location_on, size: 35),
              ),
              Tab(
                icon: new Icon(Icons.person, size: 35),
              ),
            ],
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
          ),
        ));
  }
}
