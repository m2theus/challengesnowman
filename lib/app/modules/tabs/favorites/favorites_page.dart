import 'package:challengesnowman/app/modules/models/spot_model.dart';
import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:challengesnowman/app/services/shared_preferences_service.dart';
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
  bool isAnonymous = false;

  @override
  void initState() {
    _favoritesController.getSpotsFavorites();
    UserModel userModel = sharedPreferences.getUser();
    isAnonymous = userModel.isAnonymous;
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
            return isAnonymous
                ? _buildAnonymous()
                : _favoritesController.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _favoritesController.listSpots.length > 0
                        ? Padding(
                            padding: EdgeInsets.all(12),
                            child: _populateFavorites(),
                          )
                        : Container(
                            child: _buildNoFavorites(),
                          );
          },
        ));
  }

  Widget _buildAnonymous() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 48, bottom: 16),
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            Text(
              'Logado como anônimo',
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

  Widget _buildNoFavorites() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 48, bottom: 16),
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            Text(
              'has no favorites selected',
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
          SpotModel spotModel = _favoritesController.listSpots[index];
          return Container(
              padding: EdgeInsets.only(bottom: 30, top: 30),
              child: ListTile(
                title: Text(spotModel.description),
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(spotModel.photo != null
                      ? spotModel.photo
                      : "https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.zoom.us%2Fimages%2Fen-us%2Fdesktop%2Fgeneric%2Fvideo-not-working.PNG&imgrefurl=https%3A%2F%2Fsupport.zoom.us%2Fhc%2Fen-us%2Farticles%2F208362326-Video-Not-Working-on-Lenovo-Devices&tbnid=41e5r-P6yyBzIM&vet=12ahUKEwirnLu4jv_oAhUPQFMKHXdXDqAQMygEegUIARCDAg..i&docid=oKSIqWQGnXLQeM&w=640&h=328&q=image%20not%20image&ved=2ahUKEwirnLu4jv_oAhUPQFMKHXdXDqAQMygEegUIARCDAg"),
                  backgroundColor: Colors.transparent,
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]),
                ),
              ));
        });
  }
}
