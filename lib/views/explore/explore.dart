import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/app_color.dart';
import '../../model/explorebooks_model.dart';
import '../../services/api_service.dart';
import '../../services/fetchapi.dart';
import 'widgets/bookinfo.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

List<String> explore = [
  'Drama',
  'Sports',
  'Children',
  'Greek',
  'America',
  'God of war'
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
              labelColor: Colors.black,
              indicatorColor: AppColor.tertiaryColor,
              isScrollable: true,
              indicator: null,
              dividerColor: Colors.transparent,
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
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    List<VolumeInfo> books = snapshot.data!;
                    return GridView.builder(
                      primary: F,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 1 / 1.5),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final selectedBook = books[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(BookInfo(
                              booking: selectedBook,
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.tertiaryColor),
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.secondaryColor,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      books[index].imageLinks!.thumbnail ?? '',
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  books[index].title.substring(0, 10),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  books[index].authors.join().substring(0, 7),
                                  style: const TextStyle(
                                      color: AppColor.tertiaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${explorebooks[index].price.toString()}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        onPressed: () {},
                                        child: const Text(
                                          'Buy',
                                          style: TextStyle(
                                              color: AppColor.primaryColor),
                                        ))
                                  ],
                                )
                              ],
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
