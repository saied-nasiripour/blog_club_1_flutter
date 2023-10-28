import 'package:blog_club_1_flutter/data/onboarding_data.dart';
import 'package:blog_club_1_flutter/gen/assets.gen.dart';
import 'package:blog_club_1_flutter/screens/authentication/auth_acreen.dart';
import 'package:blog_club_1_flutter/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final items = onboardingData;
  int page = 0;

  @override
  void initState() {
    super.initState();
    debugPrint("_OnBoardingScreenState -> initState");
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access theme data from the context
    final ThemeData themeData = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFFFFFFF), Color(0xFFF4F7FF)]),
      ),
      child: Scaffold(
        // By default, Scaffold background is white
        //backgroundColor: themeData.colorScheme.background,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              // Section 1: Fixed Image
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 32.0,
                    bottom: 8.0,
                  ),
                  child: Assets.img.background.onboarding.image(),
                ),
              ),
              // Section 2: Text
              // This section provides introductory some texts to welcome users to the app.
              Container(
                height: 270,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: items.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 32.0,
                                top: 32.0,
                                right: 32.0,
                                bottom: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index].title,
                                  style: themeData.textTheme.headlineSmall,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  items[index].description,
                                  style: themeData.textTheme.titleMedium!
                                      .apply(fontSizeFactor: 0.8),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      // This Container holds the onboarding button and page indicator.
                      height: 60,
                      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            // Page indicator widget.
                            // It visually represents the current onboarding screen position.
                            controller: _pageController,
                            count: items.length,
                            effect: ExpandingDotsEffect(
                              dotWidth: 8,
                              dotHeight: 8,
                              activeDotColor: themeData.colorScheme.primary,
                              dotColor: themeData.colorScheme.primary
                                  .withOpacity(0.1),
                            ),
                          ),
                          ElevatedButton(
                            // ElevatedButton for user interaction.
                            // Users can tap this button to navigate through onboarding screens
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeData.primaryColor,
                              // const Color(0xFF376AED), // Set background color
                              foregroundColor: Colors.white,
                              // set the color of the button's text or icon
                              // textStyle: const TextStyle(fontSize: 18), // Set text style
                              minimumSize: const Size(88, 60),
                              // Set minimum width to 88 and minimum height to 60
                              // define the shape and border of the button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // // Adjust the radius as needed
                              ),
                              /*
                              `RoundedRectangleBorder` is used as the shape, which creates a button with rounded corners.
                              `BorderRadius.circular(12.0)` defines the radius of the button's corners. You can adjust this value to control the degree of rounding.
                              * */
                            ),
                            onPressed: () {
                              // Add onPressed logic here
                              if (page == items.length - 1) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthScreen()));
                              } else {
                                _pageController.animateToPage(
                                  page + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                );
                              }
                            },
                            child: Icon(page == items.length - 1
                                ? CupertinoIcons.check_mark
                                : CupertinoIcons.arrow_right),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
