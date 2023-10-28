import 'package:blog_club_1_flutter/gen/assets.gen.dart';
import 'package:blog_club_1_flutter/screens/authentication/login_tab.dart';
import 'package:blog_club_1_flutter/screens/authentication/signup_tab.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signupTab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
    const socialMediaSize = {'width': 36.0, 'height': 36.0};

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // --------------------- Logo Section ---------------------
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0, top: 32.0),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
            // --------------------- Content (LOGIN & SIGN UP) Section ---------------------
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                  color: themeData.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    // --------------------- TAB MENU Section ---------------------
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = loginTab;
                                });
                              },
                              child: Text(
                                'login'.toUpperCase(),
                                style: tabTextStyle.apply(
                                  color: selectedTabIndex == loginTab
                                      ? Colors.white
                                      : Colors.white54,
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = signupTab;
                                });
                              },
                              child: Text(
                                'Sign Up'.toUpperCase(),
                                style: tabTextStyle.apply(
                                  color: selectedTabIndex == signupTab
                                      ? Colors.white
                                      : Colors.white54,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            // Spacing column content in all directions
                            padding: const EdgeInsets.fromLTRB(
                                32.0, 48.0, 32.0, 32.0),
                            // --------------------- Select Tab ---------------------
                            child: selectedTabIndex == loginTab
                                ? LoginTab(
                                    themeData: themeData,
                                    socialMediaSize: socialMediaSize)
                                : SignUpTab(
                                    themeData: themeData,
                                    socialMediaSize: socialMediaSize,
                                    loginHandler: () => setState(() {
                                      selectedTabIndex = loginTab;
                                    }),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
