import 'package:audio_books/constants/app_color.dart';
import 'package:audio_books/services/api_service.dart';
import 'package:audio_books/services/fetchapi.dart';
import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  String category = 'drama';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VolumeInfo>>(
      future: fetchBooks(category),
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
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: books.map((book) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: book.imageLinks != null
                      ? Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                book.imageLinks!.thumbnail ?? '',
                                width: 150,
                                height: 190,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )
                      : const Icon(Icons.image),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
