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
            return Row(
              children: [
                Card(
                  elevation: 4,
                  child: Image.network(
                    explorebooks[index].image,
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
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
                          style: const TextStyle(color: AppColor.buttonColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'wextcryvtubyinfuunlofhup efgepf7egpf e9f fvyvfief lhef vlvifvlefv;bceiybcfleyfgbed9fugbdfugbfu',
                          style: TextStyle(color: AppColor.buttonColor_2),
                        ),
                      ]),
                )
              ],
            );
          }),
    );
  }
}
