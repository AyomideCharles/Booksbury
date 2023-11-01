import 'package:flutter/material.dart';
import '../../../constants/app_color.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Book Info'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                'https://images.unsplash.com/photo-1553986782-9f6de60b51b4?auto=format&fit=crop&q=80&w=1749&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          ),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('The Homeric Hymns'),
            subtitle: Text('By : Michael Crudden'),
            trailing: Text(
              '\$ 200',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.secondaryColor,
                    border: Border.all(color: AppColor.buttonColor)),
                width: 100,
                height: 50,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Released'),
                    Text(
                      '2021',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              );
            }),
          ),
        ]),
      ),
    );
  }
}
