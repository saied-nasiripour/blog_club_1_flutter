import 'package:blog_club_1_flutter/gen/fonts.gen.dart';
import 'package:blog_club_1_flutter/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  /*
  // without flutter_gen :
  static const defaultFontFamily = 'Avenir';
   */
  // using flutter_gen :
  static const defaultFontFamily = FontFamily.avenir;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          background: Color(0xffFBFCFF),
          onBackground: primaryTextColor
        ),
        useMaterial3: true,

        // config Theme for textButtons
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontFamily: defaultFontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),

        // config Theme for texts
        textTheme: const TextTheme(
          // subtitle1
          titleMedium: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w200,
            color: secondaryTextColor,
          ),
          // subtitle2
          titleSmall: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: primaryTextColor,
          ),
          // headline 4
          headlineMedium: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
          ),
          // headline 5
          headlineSmall: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
          ),
          // headline 6
          titleLarge: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          // caption
          bodySmall:  TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Color(0xff7B8BB2),
          ),
          // bodyText2
          bodyMedium: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 12,
            color: secondaryTextColor,
          ),
        ),
      ),
      /*home: const Stack(
        children: [
          // Home Screen or Home Page
          Positioned.fill(child: HomeScreen()),
          // Navigation Bar or Tab Bar
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BottomNavigation(),
          ),
        ],
      ),*/
      home: const SplashScreen(),
    );
  }
}
