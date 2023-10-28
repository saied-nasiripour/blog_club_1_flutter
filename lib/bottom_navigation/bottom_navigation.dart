import 'package:flutter/material.dart';
import 'button_navigation_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = Theme.of(context);

    // Bottom Navigation Bar
    return Container(
      height: 85,
      child: Stack(
        children: [
          // 4 other buttons are placed on both sides of the Plus Button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color.fromRGBO(
                        119, 94, 98, 0.3), // color: Color(0x4D775E62),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonNavigationItem(
                    iconFileName: 'Home.png',
                    activeIconFileName: 'Home.png',
                    title: 'Home',
                    themeData: themeData,
                  ),
                  ButtonNavigationItem(
                    iconFileName: 'Articles.png',
                    activeIconFileName: 'Articles.png',
                    title: 'Articles',
                    themeData: themeData,
                  ),
                  const SizedBox(width: 8,),
                  ButtonNavigationItem(
                    iconFileName: 'Search.png',
                    activeIconFileName: 'Search.png',
                    title: 'Search',
                    themeData: themeData,
                  ),
                  ButtonNavigationItem(
                    iconFileName: 'Menu.png',
                    activeIconFileName: 'Menu.png',
                    title: 'Menu',
                    themeData: themeData,
                  ),
                ],
              ),
            ),
          ),
          // Plus Button (or Float Action Button) in the middle of the bottom Navigation/Tab Bar
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: const Color(0xff376AED),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: Image.asset(
                  'assets/img/icons/plus.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
