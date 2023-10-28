import 'package:blog_club_1_flutter/screens/authentication/password_text_field.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({
    super.key,
    required this.themeData,
    required this.socialMediaSize,
  });

  final ThemeData themeData;
  final Map<String, double> socialMediaSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --------------------- Title ---------------------
        Text(
          'Welcome back',
          style: themeData.textTheme.headlineMedium,
          // headlineMedium == headline4
        ),
        const SizedBox(height: 8.0),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.titleMedium?.apply(fontSizeFactor: 0.8),
          // titleMedium == subtitle1),
        ),
        const SizedBox(height: 16.0),
        // --------------------- Username ---------------------
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        // --------------------- Password ---------------------
        PasswordTextField(themeData: themeData, label: 'Password',),
        const SizedBox(height: 24.0),
        // --------------------- LOGIN Button ---------------------
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(themeData.primaryColor),
            foregroundColor:
                MaterialStateProperty.all(themeData.colorScheme.onPrimary),
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))),
          ),
          child: Text(
            'login'.toUpperCase(),
          ),
        ),
        // --------------------- FORGOT PASSWORD ---------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgot your password?'),
            const SizedBox(width: 8.0),
            TextButton(
              onPressed: () {},
              child: const Text('Reset here'),
            )
          ],
        ),
        const SizedBox(height: 16.0),
        // --------------------- Other Method Section ---------------------
        const Center(
          child: Text(
            'Or sign in with',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 16.0),
        // --------------------- Social Media---------------------
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Assets.img.icons.google.image(
              width: socialMediaSize['width'],
              height: socialMediaSize['height']),
          const SizedBox(width: 24.0),
          Assets.img.icons.facebook.image(
              width: socialMediaSize['width'],
              height: socialMediaSize['height']),
          const SizedBox(width: 24.0),
          Assets.img.icons.twitter.image(
              width: socialMediaSize['width'],
              height: socialMediaSize['height']),
        ])
      ],
    );
  }
}
