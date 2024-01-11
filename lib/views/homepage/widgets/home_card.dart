import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.5,
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?auto=format&fit=crop&q=80&w=1964&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        const Positioned(top: 10, right: 10, child: Icon(Iconsax.save_21)),
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
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food in the Ancient',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'World from A to Z',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              size: 18,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '15h Listen',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.person,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Andrew Dalby',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
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
