import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'favorites_controller.dart';

class FavoritesTab extends StatefulWidget {
  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  final _favoritesController = Provider.of<FavoritesController>(Get.context);

  @override
  void initState() {
    _favoritesController.getSpotsFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            color: Colors.transparent,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Favorites'),
          centerTitle: true,
        ),
        body: Observer(
          builder: (_) {
            return _favoritesController.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : _favoritesController.listSpots.length > 0
                    ? _populateFavorites()
                    : _buildNoFavorites;
          },
        ));
  }

  Widget _buildNoFavorites() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 48, bottom: 16),
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            Text(
              'You have no favorite spots yet',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                    color: Hexcolor('#606062'),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _populateFavorites() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _favoritesController.listSpots.length,
        itemBuilder: (context, index) {
          return ListTile(
            subtitle: Text("asda"),
            title: Text("asd"),
          );
        });
  }
}
