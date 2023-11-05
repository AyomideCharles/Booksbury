import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_color.dart';

class SearchController extends GetxController {
  RxList<String> searchedWords = <String>[].obs;
  TextEditingController searchController = TextEditingController();

  void addSearchedWord(String word) {
    searchedWords.add(word);
    searchController.clear();
  }

  void removeSearchedWord(int index) {
    searchedWords.removeAt(index);
  }
}

class Search extends StatelessWidget {
  final SearchController searchController = Get.put(SearchController());

  Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: searchController.searchController,
              onSubmitted: (value) {
                searchController.addSearchedWord(value);
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Search Books...',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cancel),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: searchController.searchedWords.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: IconButton(
                      onPressed: () {
                        searchController.removeSearchedWord(index);
                      },
                      icon: const Icon(Icons.cancel),
                    ),
                    title: Text(searchController.searchedWords[index]),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
