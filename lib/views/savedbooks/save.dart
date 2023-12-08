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
          padding: const EdgeInsets.all(15),
          itemCount: explorebooks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Card(
                    elevation: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        explorebooks[index].image,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            explorebooks[index].title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            explorebooks[index].author,
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
                            style: TextStyle(color: AppColor.buttonColor_2),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]),
                  )
                ],
              ),
            );
          }),
    );
  }
}
