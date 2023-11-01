import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: F,
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.network(
              'https://res.cloudinary.com/dxje0rp9f/image/upload/v1673446386/Link%20Park/unsplash_s9CC2SKySJM_1_qzsoaq.png',
            ),
            title: const Text('History of the Ancient Worlds'),
            subtitle: const Text('Name of Author'),
            // tileColor: Colors.red,
          );
        });
  }
}
