import 'package:blog_club_1_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data.dart';

// Post list or News list
class PostList extends StatelessWidget {
  const PostList({
    super.key,
    required this.themeData,
    required this.posts,
  });

  final ThemeData themeData;
  final List<PostData> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        Padding(
          padding: const EdgeInsets.only(
            left: 32.0,
            right: 16.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: themeData.textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(
                    color: Color(0xff376AED),
                  ),
                ),
              )
            ],
          ),
        ),
        ListView.builder(
          itemCount: posts.length,
          // height of each post or news or item
          itemExtent: 141,
          // automatic adjustment of the height of the list based on the total height of all post or news or item ==> height of the list = items * (height of each item)
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final post = posts[index];
            return Container(
              margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Color.fromRGBO(82, 130, 255, 0.06),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                        'assets/img/posts/small/${post.imageFileName}'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.caption,
                            style: TextStyle(
                              fontFamily: MyApp.defaultFontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: themeData.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            post.title,
                            style: themeData.textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.hand_thumbsup,
                                size: 16,
                                color: themeData.textTheme.bodyMedium?.color,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                post.likes,
                                style: themeData.textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Icon(
                                CupertinoIcons.clock,
                                size: 16,
                                color: themeData.textTheme.bodyMedium?.color,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                post.time,
                                style: themeData.textTheme.bodyMedium,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    post.isBookmarked
                                        ? CupertinoIcons.bookmark_fill
                                        : CupertinoIcons.bookmark,
                                    size: 16,
                                    color:
                                        themeData.textTheme.bodyMedium?.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
