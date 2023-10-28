import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../data.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
    required this.stories,
    required this.themeData,
  });

  final List<StoryData> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final story = stories[index];
          return _Story(story: story, themeData: themeData);
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
    required this.themeData,
  });

  final StoryData story;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileImageViewed(context)
                  : _profileImageNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            story.name,
            style: themeData.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFb),
          ],
        ),
        // border: const GradientBoxBorder(
        //   gradient: LinearGradient(
        //       colors: [Colors.blue, Colors.red]),
        //   width: 4,
        // ),
        // borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24.0),
        // color: Theme.of(context).textTheme.bodyMedium!.color!,
        color: const Color(0xff7B8BB2),
        dashPattern: const [8, 3],
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            // border: const GradientBoxBorder(
            //   gradient: LinearGradient(
            //       colors: [Colors.blue, Colors.red]),
            //   width: 4,
            // ),
            // borderRadius: BorderRadius.circular(16),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset(
        'assets/img/stories/${story.imageFileName}',
      ),
    );
  }
}
