// SNP Home Screen

import 'package:blog_club_1_flutter/data.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../carousel/carousel_slider.dart';
import 'header.dart';
import 'package:blog_club_1_flutter/screens/home/story_list.dart';
import 'category_list.dart';
import 'package:blog_club_1_flutter/screens/home/post_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    final posts = AppDatabase.posts;
    final categories = AppDatabase.categories;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(themeData: themeData),
              // Stories
              StoryList(stories: stories, themeData: themeData),
              const SizedBox(
                height: 16.0,
              ),
              // Topics
              CategoryList(
                  stories: stories,
                  themeData: themeData,
                  categories: categories),
              // Latest News
              PostList(themeData: themeData, posts: posts),
              const SizedBox(
                height: 32.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
