import 'package:audio_books/model/explorebooks_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../constants/app_color.dart';

class BookInfo extends StatefulWidget {
  final ExploreBooks booking;
  const BookInfo({super.key, required this.booking});

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> with TickerProviderStateMixin {
  late TabController tabControll;

  @override
  void initState() {
    tabControll = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Book Info'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.booking.image),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(widget.booking.title),
              subtitle: Text(widget.booking.author),
              trailing: Text(
                '\$${widget.booking.price.toString()}',
                style: const TextStyle(fontSize: 16),
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
            TabBar(
                indicatorColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                controller: tabControll,
                tabs: const [
                  Tab(
                    text: 'Sypnosis',
                  ),
                  Tab(
                    text: 'Details',
                  ),
                  Tab(
                    text: 'Author',
                  ),
                  Tab(
                    text: 'Review',
                  )
                ]),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height,
              child: TabBarView(controller: tabControll, children: const [
                Text('tab 1 view'),
                Text('tab 2 view'),
                Text('tab 3 view'),
                Text('tab 4 view'),
              ]),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: AppColor.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(
                        Iconsax.book,
                        color: AppColor.buttonColor_2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Start Reading',
                        style: TextStyle(color: AppColor.buttonColor_2),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonColor_2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(
                        Iconsax.audio_square,
                        color: AppColor.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Play Audio',
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
