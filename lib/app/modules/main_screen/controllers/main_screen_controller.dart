import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:quizu/app/core/colors.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/modules/home/views/home_view.dart';
import 'package:quizu/app/modules/leaderboard/views/leaderboard_view.dart';
import 'package:quizu/app/modules/profile/views/profile_view.dart';

class MainScreenController extends GetxController {
  PersistentTabController tapController =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      HomeView(),
      LeaderboardView(),
      ProfileView(),
    ];
  }

  TextStyle ts = TextStyle(
      fontFamily: 'myFont',
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.red);

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(home, color: primaryColor, width: 30),
          title: 'Home',
          textStyle: ts,
          activeColorPrimary: primaryColor),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(leaderboard, color: primaryColor, width: 30),
          // title: 'Leaderboard',
          textStyle: ts,
          activeColorPrimary: primaryColor),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(profile, color: primaryColor, width: 30),
          title: 'Profile',
          textStyle: ts,
          activeColorPrimary: primaryColor),
    ];
  }
}
