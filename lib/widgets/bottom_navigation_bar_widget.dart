import 'package:bravo_news/screens/home_screen.dart';
import 'package:bravo_news/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavigationBarContainer extends StatelessWidget {
  const BottomNavigationBarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
      child: GNav(
          rippleColor: Colors.white, // tab button ripple color when pressed
          haptic: true, // haptic feedback
          tabBorderRadius: 50,
          tabActiveBorder: Border.all(
              color: const Color.fromRGBO(11, 134, 231, 1),
              width: 1), // tab button border
          tabBorder: null, // tab button border
          tabShadow: null, // tab button shadow
          curve: Curves.easeInCubic, // tab animation curves
          duration: const Duration(milliseconds: 100), // tab animation duration
          gap: 6, // the tab button gap between icon and text
          color: Colors.grey[400], // unselected icon color
          activeColor: Colors.white, // selected icon and text color
          iconSize: 26, // tab button icon size
          tabBackgroundColor: const Color.fromRGBO(
              11, 134, 231, 1), // selected tab background color
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 8), // navigation bar padding
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
            ),
            const GButton(
              icon: LineIcons.globe,
              text: 'Discover',
            ),
            const GButton(
              icon: LineIcons.bookmark,
              text: 'Saved',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profile',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            )
          ]),
    );
  }
}
