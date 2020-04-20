import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:challengesnowman/app/modules/login/login_controller.dart';
import 'package:challengesnowman/app/modules/login/login_page.dart';
import 'package:flutter/material.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LoginController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
