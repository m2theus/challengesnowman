import 'package:challengesnowman/app/modules/login/login_module.dart';
import 'package:challengesnowman/app/modules/router/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pontos turisticos',
      navigatorKey: Get.key,
      initialRoute: "/",
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().toString(),
        primaryColor: Color.fromRGBO(16, 21, 154,1),
      ),
      home: LoginModule(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
