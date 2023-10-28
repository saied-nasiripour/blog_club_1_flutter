import 'package:flutter/material.dart';
import 'package:blog_club_1_flutter/gen/assets.gen.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _nameAndAlarm(),
        _title(),
      ],
    );
  }

  Padding _title() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 0, 0, 24),
      child: Text(
        'Explore today’s',
        style: themeData.textTheme.headlineMedium,
      ),
    );
  }

  Padding _nameAndAlarm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hi, Jonathan!",
            style: themeData.textTheme.titleMedium,
          ),
          // Image.asset(
          //   'assets/img/icons/notification.png',
          //   width: 32,
          //   height: 32,
          // ),
          Assets.img.icons.notification.image(
            width: 32,
            height: 32,
          ),
        ],
      ),
    );
  }
}
