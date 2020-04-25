import 'package:challengesnowman/app/app_widget.dart';
import 'package:challengesnowman/app/modules/home/home_page.dart';
import 'package:challengesnowman/app/modules/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetRoute(
          page: AppWidget(),
          settings: settings,
        );
      case '/login':
        return GetRoute(
            settings: settings,
            page: LoginPage(),
            transition: Transition.fade);
      case '/home':
        return GetRoute(
            settings: settings,
            page: HomePage(),
            transition: Transition.fade);
      case '/home/map':
        return GetRoute(
            settings: settings,
            page: HomePage(index: 1,),
            transition: Transition.fade);
      case '/home/favorites':
        return GetRoute(
            settings: settings,
            page: HomePage(index: 0,),
            transition: Transition.fade);
      default:
        return GetRoute(
            settings: settings, transition: Transition.fade, page: AppWidget());
    }
  }
}
