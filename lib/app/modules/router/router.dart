import 'package:challengesnowman/app/app_module.dart';
import 'package:challengesnowman/app/modules/home/home_module.dart';
import 'package:challengesnowman/app/modules/login/login_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetRoute(
          page: AppModule(),
          settings: settings,
        );
      case '/login':
        return GetRoute(
            settings: settings,
            page: LoginModule(),
            transition: Transition.fade);
      case '/home':
        return GetRoute(
            settings: settings,
            page: HomeModule(),
            transition: Transition.fade);
      default:
        return GetRoute(
            settings: settings, transition: Transition.fade, page: AppModule());
    }
  }
}
