import 'package:challengesnowman/app/modules/login/components/login_button.dart';
import 'package:challengesnowman/app/modules/login/components/text_login_button.dart';
import 'package:challengesnowman/app/modules/login/login_controller.dart';
import 'package:challengesnowman/app/modules/shared/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = Provider.of<LoginController>(Get.context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _background(context),
            _buildContainerCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerCard(BuildContext context) {
    return Observer(
      builder: (_) {
        return Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: _loginController.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      ),
                    )
                  : _buildContent(context)),
        );
      },
    );
  }

  Container _background(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        'assets/images/background.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildButtons(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LoginButton(isSignInButton: true),
          LoginButton(isSignInButton: false),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: ButtonCustom(
              onTap: () {
                _loginController.loginAninimous();
              },
              label: "Anonymous",
              width: MediaQuery.of(context).size.width * 0.80,
              color: Colors.yellow[600],
              colorLabel: Theme.of(context).primaryColor,
              margin: EdgeInsets.only(top: 40),
            ),
          )

//            AnonymousButton(),
        ],
      ),
    );
  }

  Widget _buildContent(context) {
    return _loginController.isLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor),
            ),
          )
        : Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                TextTitlesLogin(),
                SizedBox(
                  height: 10,
                ),
                _buildButtons(context),
              ],
            ),
          );
  }
}
