import 'package:challengesnowman/app/modules/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({@required this.isSignInButton});

  final bool isSignInButton;

  @override
  Widget build(BuildContext context) {
    final _loginController = Provider.of<LoginController>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: isSignInButton ? Colors.white : Theme.of(context).primaryColor,
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 60,
            child: InkWell(
              onTap: () => isSignInButton
                  ? _loginController.login()
                  : _loginController.signUp(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      isSignInButton
                          ? 'assets/images/facebook_signin.png'
                          : 'assets/images/facebook_signup.png',
                    ),
                  ),
                  Text(
                    isSignInButton
                        ? 'Sign in with Facebook'
                        : 'Sign up with Facebook',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                          color: isSignInButton
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
