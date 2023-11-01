import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 350,
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://res.cloudinary.com/dxje0rp9f/image/upload/v1673446386/Link%20Park/unsplash_s9CC2SKySJM_1_qzsoaq.png',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
        const Positioned(top: 10, right: 10, child: Icon(Iconsax.save_2)),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            padding: const EdgeInsets.all(10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Food in the Ancient',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(Icons.play_arrow),
                        Text(
                          '15h Listen',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'World from A to Z',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text(
                          'Andrew Dalby',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
