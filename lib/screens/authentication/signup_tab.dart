import 'package:blog_club_1_flutter/screens/authentication/password_text_field.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class SignUpTab extends StatelessWidget {
  const SignUpTab({
    super.key,
    required this.themeData,
    required this.socialMediaSize,
    required this.loginHandler,
  });

  final ThemeData themeData;
  final Function loginHandler;
  final Map<String, double> socialMediaSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --------------------- Title ---------------------
        Text(
          'Create an account',
          style: themeData.textTheme.headlineMedium,
          // headlineMedium == headline4
        ),
        const SizedBox(height: 16.0),
        // --------------------- Username ---------------------
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        // --------------------- Password ---------------------
        PasswordTextField(
          themeData: themeData,
          label: 'Password',
        ),
        const SizedBox(height: 24.0),
        // --------------------- Confirm Password ---------------------
        PasswordTextField(
          themeData: themeData,
          label: 'Confirm Password',
        ),
        const SizedBox(height: 24.0),
        // --------------------- SIGN UP Button ---------------------
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
          child: const Text(
            'SIGN UP',
          ),
        ),
        const SizedBox(height: 16.0),
        // --------------------- Other Method Section ---------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            const SizedBox(width: 8.0),
            TextButton(
              onPressed: () =>loginHandler(),
              child: const Text('Login'),
            )
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
