import 'package:audio_books/views/homepage/widgets/home_card.dart';
import 'package:audio_books/views/homepage/widgets/home_list.dart';
import 'package:flutter/material.dart';
import 'package:audio_books/constants/app_color.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Row(
          children: [
            const Icon(Iconsax.book),
            const SizedBox(
              width: 10,
            ),
            RichText(
                text: const TextSpan(
                    style:
                        TextStyle(fontFamily: 'DM Serif Display', fontSize: 24),
                    children: [
                  TextSpan(
                      text: 'Books',
                      style: TextStyle(color: AppColor.buttonColor_2)),
                  TextSpan(
                      text: 'bury',
                      style: TextStyle(color: AppColor.buttonColor))
                ]))
          ],
        ),
        actions: [
          const Icon(Iconsax.notification),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          HomeCard(),
          SizedBox(
            height: 15,
          ),
          Text(
            'Popular Books',
            style: TextStyle(fontSize: 25),
          ),
          HomeList()
        ],
      ),
    );
  }
}
