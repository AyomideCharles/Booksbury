import 'package:audio_books/constants/app_color.dart';
import 'package:audio_books/model/explorebooks_model.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Books'),
        backgroundColor: AppColor.secondaryColor,
      ),
      body: ListView.builder(
          itemCount: explorebooks.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Image.network(
                  explorebooks[index].image,
                  width: 100,
                ),
                Text(explorebooks[index].title),
              ],
            );
            // return ListTile(
            //   leading: Image.network(explorebooks[index].image),
            //   title: Text(explorebooks[index].title),
            //   subtitle: Text(explorebooks[index].author),
            // );
          }),
    );
  }
}
