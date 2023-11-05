import 'package:audio_books/constants/app_color.dart';
import 'package:audio_books/model/explorebooks_model.dart';
import 'package:audio_books/services/fetchapi.dart';
import 'package:audio_books/views/explore/widgets/bookinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../services/api_service.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploremarket(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColor.tertiaryColor,
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<VolumeInfo> books = snapshot.data!;
          return GridView.builder(
            primary: F,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.secondaryColor,
                  ),
                  padding: const EdgeInsets.all(10),
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
                            fontSize: 17, fontWeight: FontWeight.w500),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${explorebooks[index].price.toString()}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () {},
                              child: const Text(
                                'Buy',
                                style: TextStyle(color: AppColor.primaryColor),
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
  }
}
