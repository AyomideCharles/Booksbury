import 'package:audio_books/constants/app_color.dart';
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
      body: ListView.builder(itemBuilder: (context, index) {
        return const ListTile();
      }),
    );
  }
}
