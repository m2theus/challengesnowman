import 'package:challengesnowman/app/modules/models/spot_model.dart';
import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:challengesnowman/app/modules/shared/components/button.dart';
import 'package:challengesnowman/app/modules/tabs/user/user_controller.dart';
import 'package:challengesnowman/app/services/authorization.dart';
import 'package:challengesnowman/app/services/shared_preferences_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class UserTab extends StatefulWidget {
  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  final _userController = Provider.of<UserController>(Get.context);
  UserModel _user;

  @override
  void initState() {
    _user = sharedPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            color: Colors.transparent,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('User'),
          centerTitle: true,
        ),
        body: Observer(
          builder: (_) {
            return _userController.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.all(12),
                    child: _buildUser(),
                  );
          },
        ));
  }

  Widget _buildUser() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 48, bottom: 16),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(_user.photoUrl != null
                  ? _user.photoUrl
                  : "https://www.google.com/imgres?imgurl=https%3A%2F%2Fd1bvpoagx8hqbg.cloudfront.net%2F259%2F0f326ce8a41915e8b1d21ffaee087fae.jpg&imgrefurl=https%3A%2F%2Ferasmusu.com%2Fpt%2Fno-user-263462&tbnid=IfBVFUTVWp9rrM&vet=12ahUKEwiukdCIj4bpAhVDMLkGHXsVASYQMygBegUIARCCAg..i&docid=6X51Uc22jwnfkM&w=259&h=259&q=no%20user&ved=2ahUKEwiukdCIj4bpAhVDMLkGHXsVASYQMygBegUIARCCAg"),
              backgroundColor: Colors.transparent,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                _user.fullName != null
                    ? _user.fullName
                    : "Logado como anônimo",
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      color: Hexcolor('#606062'),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _user.email != null
                ? Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      _user.email,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Hexcolor('#606062'),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Container(child: Text("Sem email"),),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ButtonCustom(
                onTap: () {
                  _userController.logout();
                },
                label: "Logout",
                width: MediaQuery.of(context).size.width * 0.70,
                color: Colors.yellow[600],
                colorLabel: Theme.of(context).primaryColor,
                margin: EdgeInsets.only(top: 40),
              ),
            )
          ],
        ),
      ),
    );
  }
}
