import 'dart:async';

import 'package:challengesnowman/app/modules/tabs/favorites/favorites_page.dart';
import 'package:challengesnowman/app/modules/tabs/map/tab_map_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;
  final int index;
  const HomePage({Key key, this.title = "Home", this.index = 1})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  final Key _mapKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: widget.index,
        length: 3,
        child: new Scaffold(
          body: Container(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                new Container(
                  child: FavoritesTab(),
                ),
                new Container(
                  child: TabMapPage(key: _mapKey),
                ),
                new Container(
                  color: Colors.lightGreen,
                ),
              ],
            ),
          ),
          bottomNavigationBar: new TabBar(
            dragStartBehavior: DragStartBehavior.down,
            isScrollable: false,
            tabs: [
              Tab(
                icon: new Icon(
                  Icons.star,
                  size: 35,
                ),
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
