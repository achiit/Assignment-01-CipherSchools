import 'package:assignment/screens/courses.dart';
import 'package:assignment/screens/trending.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'screens/homescreen.dart';
import 'screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themedata = GetStorage();
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool darkmode = themedata.read('darkmode') ?? false;
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: FloatingNavBar(
        resizeToAvoidBottomInset: false,
        color: Colors.white,
        items: [
          FloatingNavBarItem(
            iconData: Icons.home,
            title: 'Home',
            page: HomeScreen(),
          ),
          FloatingNavBarItem(
            iconData: Icons.collections_bookmark_outlined,
            title: 'Courses',
            page: Courses(),
          ),
          FloatingNavBarItem(
            iconData: Icons.compass_calibration_rounded,
            title: 'Trending',
            page: Trending(),
          ),
          FloatingNavBarItem(
            iconData: Icons.account_circle,
            title: 'Account',
            page: Profile(),
          )
        ],
        selectedIconColor: Colors.orange,
        hapticFeedback: false,
        horizontalPadding: 40,
        unselectedIconColor: Colors.black,
      ),
    );
  }
}
