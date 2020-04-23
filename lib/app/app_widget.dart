import 'package:challengesnowman/app/modules/login/login_controller.dart';
import 'package:challengesnowman/app/modules/login/login_page.dart';
import 'package:challengesnowman/app/modules/router/router.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/new_spot_controller.dart';
import 'package:challengesnowman/app/modules/tabs/map/tab_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          title: 'Pontos turisticos',
          navigatorKey: Get.key,
          initialRoute: "/",
          theme: ThemeData(
            fontFamily: GoogleFonts.roboto().toString(),
            primaryColor: Color.fromRGBO(16, 21, 154, 1),
          ),
          home: LoginPage(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Router.generateRoute,
        ),
        providers: [
          Provider<LoginController>(
            create: (_) => LoginController(),
          ),
          Provider<TabMapController>(
            create: (_) => TabMapController(),
          ),
          Provider<NewSpotController>(
            create: (_) => NewSpotController(),
          ),
        ]);
  }
}
