import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/app_color.dart';
import '../../services/api_service.dart';
import '../../services/fetchapi.dart';
import 'widgets/bookinfo.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

List<String> explore = [
  'Computers',
  'African Stories',
  'Sports',
  'Fiction',
  'Greek',
  'America',
  'Educational'
];

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: explore.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.secondaryColor,
          title: const Text('Explore Market'),
          actions: const [
            Icon(Iconsax.notification),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Icon(Icons.search),
            )
          ],
          bottom: TabBar(
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.zero,
              labelColor: Colors.black,
              indicatorColor: AppColor.tertiaryColor,
              isScrollable: true,
              tabs: explore
                  .map(
                    (e) => Tab(
                      text: e,
                    ),
                  )
                  .toList()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TabBarView(
            children: explore.map((category) {
              return FutureBuilder(
                future: fetchBooks(category),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error ?? ''}'));
                  } else {
                    List<VolumeInfo> books = snapshot.data ?? [];
                    return GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 300,
                      ),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final selectedBook = books[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => BookInfo(booking: selectedBook));
                          },
                          child: Card(
                            shadowColor: Colors.grey.shade900,
                            surfaceTintColor: AppColor.secondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            elevation: 8,
                            color: AppColor.secondaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(5.5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        books[index].imageLinks?.thumbnail ??
                                            'https://images.unsplash.com/photo-1682687982423-295485af248a?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      books[index].title,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      books[index].authors.join(),
                                      style: const TextStyle(
                                          color: AppColor.tertiaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            onPressed: () {},
                                            child: const Text(
                                              'Read More',
                                              style: TextStyle(
                                                  color: AppColor.primaryColor),
                                            ))
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
