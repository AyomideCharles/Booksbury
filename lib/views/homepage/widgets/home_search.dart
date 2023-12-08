import 'package:audio_books/constants/app_color.dart';
import 'package:audio_books/views/explore/widgets/bookinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/api_service.dart';
import '../../../services/fetchapi.dart';

class SearchController extends GetxController {
  var searchResults = <VolumeInfo>[].obs;
  var isSearching = false.obs;

  void search(String query) async {
    try {
      isSearching.value = true;
      List<VolumeInfo> results = await fetchBooks(query);
      searchResults.value = results;
    } catch (e) {
      // Handle errors, e.g., show an error message to the user
    } finally {
      isSearching.value = false;
    }
  }

  void clearSearch() {
    searchResults.clear();
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController searchController = Get.put(SearchController());
  TextEditingController searchCancel = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                focusNode: _searchFocus,
                controller: searchCancel,
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    searchController.search(query);
                  } else {
                    // Clear search results when query is empty
                    searchController.clearSearch();
                  }
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Search Books...',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchFocus.unfocus();
                      searchCancel.clear();
                      searchController.clearSearch();
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                if (searchController.isSearching.value) {
                  return const CircularProgressIndicator(
                    color: AppColor.tertiaryColor,
                  );
                } else if (searchController.searchResults.isEmpty) {
                  if (searchController.isSearching.value) {
                    return const SizedBox
                        .shrink(); // Return an empty widget if still searching
                  } else {
                    return const Text('No books available.');
                  }
                } else {
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: searchController.searchResults.length,
                    itemBuilder: (context, index) {
                      VolumeInfo result = searchController.searchResults[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => BookInfo(booking: result));
                        },
                        child: ListTile(
                          leading:
                              Image.network(result.imageLinks?.thumbnail ?? ''),
                          title: Text(result.title),
                          subtitle: Text(result.authors.join()),
                        ),
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
