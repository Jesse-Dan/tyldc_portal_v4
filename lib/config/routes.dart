import 'package:flutter_facebook_responsive_ui/screens/main_screen.dart';
import 'package:flutter_facebook_responsive_ui/screens/screens.dart';
import 'package:get/get.dart';

var appRoutes = [
  GetPage(name: HomeScreen.routeName, page:() => HomeScreen(),)
,  GetPage(name: MainScreen.routeName, page:() => MainScreen(),)
,  GetPage(name: NavScreen.routeName, page:() => NavScreen(),)
];
