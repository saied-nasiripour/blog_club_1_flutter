// SNP Category List
import 'package:flutter/material.dart';
import '../../carousel/carousel_slider.dart';
import '../../data.dart';

class CategoryList extends StatelessWidget {
  const CategoryList(
      {super.key,
      required this.stories,
      required this.themeData,
      required this.categories});

  final List<StoryData> stories;
  final ThemeData themeData;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return _CategoryItem(
          category: categories[realIndex],
          themeData: themeData,
          // If this _CategoryItem was the first _CategoryItem
          left: realIndex == 0 ? 32 : 8,
          // If this _CategoryItem was the last _CategoryItem
          right: realIndex == categories.length - 1 ? 32 : 8,
        );
      },
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.8,
        // %80
        aspectRatio: 1.2,
        initialPage: 0,
        disableCenter: true,
        autoPlay: false,
        enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enlargeCenterPage: true,
        scrollPhysics: const BouncingScrollPhysics(),
        padEnds: false,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    super.key,
    required this.category,
    required this.themeData,
    required this.left,
    required this.right,
  });

  final Category category;
  final ThemeData themeData;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          // A shadow placed at the bottom and behind each container
          Positioned.fill(
            top: 100,
            right: 65,
            left: 65,
            bottom: 24,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xaa0d253c),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(32.0),
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Color(0xff0D253C),
                    Colors.transparent,
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.0),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Title on each container
          Positioned(
            bottom: 48,
            left: 32,
            child: Text(
              category.title,
              style: themeData.textTheme.titleLarge?.apply(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
