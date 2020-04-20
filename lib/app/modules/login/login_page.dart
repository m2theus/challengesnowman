import 'package:challengesnowman/app/modules/login/components/login_button.dart';
import 'package:challengesnowman/app/modules/login/components/text_login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: _buildContent(context)),
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
//            AnonymousButton(),
        ],
      ),
    );
  }

  Widget _buildContent(context) {
    return Container(
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
