import 'package:audio_books/model/popularbooks_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: F,
        itemCount: popular.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(popular[index].image),
            ),
            title: Text(popular[index].title),
            subtitle: Text(popular[index].author),
          );
        });
  }
}
