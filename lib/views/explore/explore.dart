import 'package:audio_books/views/explore/widgets/explore_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/app_color.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

List explore = [
  {'icon': Icons.trending_up_rounded, 'explore': 'Trending'},
  {'icon': Iconsax.heart, 'explore': 'Romance'},
  {'icon': Icons.child_care, 'explore': 'Children'},
  {'icon': Icons.trending_down, 'explore': 'Ancient'},
  {'icon': Icons.trending_down, 'explore': 'Hymns'},
];

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: explore.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text('Explore Market'),
          actions: const [
            Icon(Iconsax.notification),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Icon(Iconsax.search_favorite),
            )
          ],
          bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: AppColor.tertiaryColor,
              isScrollable: true,
              indicator: null,
              dividerColor: Colors.transparent,
              tabs: explore
                  .map(
                    (e) => Text(e['explore']),
                  )
                  .toList()),
        ),
        body: const Padding(
          padding: EdgeInsets.all(15.0),
          child: TabBarView(children: [
            ExploreCard(),
            ExploreCard(),
            ExploreCard(),
            ExploreCard(),
          ]),
        ),
      ),
    );
  }
}
