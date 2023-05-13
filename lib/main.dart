import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/navigation_service.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/config/routes.dart';
import 'package:flutter_facebook_responsive_ui/screens/main_screen.dart';
import 'package:flutter_facebook_responsive_ui/screens/screens.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TYLDC Protal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      initialRoute: MainScreen.routeName,
      getPages: appRoutes,

      // home: NavScreen(),
    );
  }
}
