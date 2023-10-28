import 'package:blog_club_1_flutter/gen/assets.gen.dart';
import 'package:blog_club_1_flutter/screens/home/home_screen.dart';
import 'package:blog_club_1_flutter/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
            (value){

              // Transfer to another page similar to the transition of Android platform.
              /*
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const OnBoardingScreen()));
              // You can use the solution written in the bottom line
              */
              /*
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const OnBoardingScreen();
              }));
              */

              // Transfer to another page similar to the transition of iOS platform.
              /*
              Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> const OnBoardingScreen()));
              // You can use the solution written in the bottom line
              */
              /*
              Navigator.of(context).push(CupertinoPageRoute(builder: (context){
                return const OnBoardingScreen();
              }));
              */

              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                return const OnBoardingScreen();
              }));

            }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.img.background.splash.image(
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Assets.img.icons.logo.svg(width: 100),
          ),
        ],
      ),
    );
  }
}
