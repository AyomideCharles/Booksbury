import 'package:audio_books/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/api_service.dart';
import '../../../services/fetchapi.dart';

class SearchController extends GetxController {
  var searchResults = <VolumeInfo>[].obs;

  void search(String query) async {
    try {
      List<VolumeInfo> results = await fetchBooks(query);
      searchResults.value = results;
    } catch (e) {
      // Handle errors, e.g., show an error message to the user
    }
  }
}

class SearchScreen extends StatelessWidget {
  final SearchController searchController = Get.put(SearchController());

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (query) {
                    if (query.isNotEmpty) {
                      searchController.search(query);
                    }
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
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: searchController.searchResults.length,
                  itemBuilder: (context, index) {
                    VolumeInfo result = searchController.searchResults[index];
                    return ListTile(
                      leading:
                          Image.network(result.imageLinks?.thumbnail ?? ''),
                      title: Text(result.title),
                      subtitle: Text('Author: ${result.authors}'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
