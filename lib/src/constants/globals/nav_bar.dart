import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sabi_savis/src/config/colors.dart';
import 'package:sabi_savis/src/features/bookings/presentation/bookings.dart';
import 'package:sabi_savis/src/features/calender/presentation/calender.dart';
import 'package:sabi_savis/src/features/home_and_actions/presentation/home.dart';
import 'package:sabi_savis/src/features/inbox/presentation/inbox.dart';
import 'package:sabi_savis/src/features/profile/presentation/profile.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: kWhite, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(5.0),
        colorBehindNavBar: const Color.fromARGB(255, 38, 60, 61),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      // screenTransitionAnimation: const ScreenTransitionAnimation(
      //   // Screen transition animation on change of selected tab.
      //   animateTabTransition: true,
      //   curve: Curves.ease,
      //   duration: Duration(milliseconds: 200),
      // ),
      navBarStyle:
          NavBarStyle.style5, // Choose the nav bar style with this property.
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      iconSize: 20,
      title: ("Home"),
      activeColorPrimary: kPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.book_online_outlined),
      iconSize: 20,
      title: ("Bookings"),
      activeColorPrimary: kPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.calendar_month_outlined),
      iconSize: 20,
      title: ("Calender"),
      activeColorPrimary: kPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.chat_bubble_outline_rounded),
      iconSize: 20,
      title: ("Inbox"),
      activeColorPrimary: kPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person_4_outlined),
      iconSize: 20,
      title: ("Profile"),
      activeColorPrimary: kPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}

List<Widget> _buildScreens() {
  return [
    const Home(),
    const Bokkings(),
    const Calender(),
    const Inbox(),
    const Profile(),
  ];
}
