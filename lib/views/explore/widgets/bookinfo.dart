import 'package:audio_books/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../constants/app_color.dart';

class BookInfo extends StatefulWidget {
  final VolumeInfo booking;
  const BookInfo({super.key, required this.booking});

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> with TickerProviderStateMixin {
  late TabController tabControll;

  List cardInfo = [
    {'info': 'Released'},
    {'info': 'Part'},
    {'info': 'Pages'},
  ];

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
              child: Image.network(
                widget.booking.imageLinks!.thumbnail ?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(widget.booking.title),
              subtitle: Text(widget.booking.authors.join()),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(cardInfo[index]['info']),
                      Text(
                        widget.booking.pageCount.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
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
              child: TabBarView(controller: tabControll, children: [
                Text(widget.booking.description ?? ''),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text('Date: '),
                        Text(widget.booking.publishedDate),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Publisher: '),
                        Text(widget.booking.publisher ?? ''),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Subtitle: '),
                        Text(widget.booking.subtitle ?? ''),
                      ],
                    )
                  ],
                ),
                const Text('tab 3 view'),
                const Text('tab 4 view'),
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
                        Iconsax.document_download,
                        color: AppColor.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Save Book',
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
