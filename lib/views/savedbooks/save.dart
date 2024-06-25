import 'package:audio_books/constants/app_color.dart';
import 'package:audio_books/controllers/saved_books_controller.dart';
import 'package:audio_books/views/explore/widgets/bookinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({
    super.key,
  });

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Books'),
          backgroundColor: AppColor.secondaryColor,
        ),
        body: GetBuilder<SavedBooksController>(
            init: Get.put(SavedBooksController()),
            builder: (controller) {
              if (controller.savedBooks.isEmpty) {
                return const Center(
                    child: Text(
                  'No Book Saved',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ));
              } else {
                return ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.savedBooks.length,
                    itemBuilder: (context, index) {
                      final book = controller.savedBooks[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  showSnack();
                                  controller.removeSavedBook(
                                      controller.savedBooks[index]);
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => BookInfo(booking: book));
                            },
                            child: Row(
                              children: [
                                Card(
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      controller.savedBooks[index].imageLinks
                                              ?.thumbnail ??
                                          '',
                                      height: 150,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.savedBooks[index].title,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          controller.savedBooks[index].authors
                                              .join(", "),
                                          style: const TextStyle(
                                              color: AppColor.buttonColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'In the mystical realm of Eldoria, where magic intertwines with the mundane, a tale unfolds that transcends time and space. "Whispers of Eternity" follows the journey of Elara, a reluctant heroine burdened with a destiny she never sought. In the mystical realm of Eldoria, where magic intertwines with the mundane, a tale unfolds that transcends time and space. "Whispers of Eternity" follows the journey of Elara, a reluctant heroine burdened with a destiny she never sought.',
                                          style: TextStyle(
                                              color: AppColor.buttonColor_2),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            }));
  }

  void showSnack() {
    Get.snackbar("Deleted", "",
        colorText: AppColor.tertiaryColor,
        backgroundColor: AppColor.primaryColor,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2));
  }
}
