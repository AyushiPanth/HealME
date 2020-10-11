import 'package:flutter/material.dart';
import 'package:healme/Screens/profile/profile.dart';
import 'package:healme/models/user.dart';
import 'package:provider/provider.dart';
import 'Screens/Calorie/calorie-counter.dart';
import 'Screens/music/music_menu.dart';
import 'Screens/yoga/poses.dart';
import 'constants.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyHome extends StatelessWidget {
  final int index;
  const MyHome({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: index);

    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: kPrimaryColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
      true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
      true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    CalorieCounter(),
    Poses(),
    Music(),
    ProfilePage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.local_fire_department),
      title: ("Calorie counter"),
      activeColor: kwhite,
      inactiveColor: kPrimaryLightColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.self_improvement),
      title: ("Yoga"),
      activeColor: kwhite,
      inactiveColor: kPrimaryLightColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.music_note),
      title: ("Music"),
      activeColor: kwhite,
      inactiveColor: kPrimaryLightColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.account_circle),
      title: ("Profile"),
      activeColor: kwhite,
      inactiveColor: kPrimaryLightColor,
    ),
  ];
}
