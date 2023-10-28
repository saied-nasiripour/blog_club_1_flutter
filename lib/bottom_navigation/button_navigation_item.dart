import 'package:flutter/material.dart';

class ButtonNavigationItem extends StatelessWidget {
  const ButtonNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.themeData});

  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: themeData.textTheme.bodySmall,
        )
      ],
    );
  }
}
