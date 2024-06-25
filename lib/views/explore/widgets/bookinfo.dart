import 'package:audio_books/controllers/saved_books_controller.dart';
import 'package:audio_books/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';
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
    {
      'info': 'Released',
      'widget': 'widget.booking.pageCount.toString()',
    },
    {
      'info': 'Part',
      'widget': 'widget.booking.pageCount.toString()',
    },
    {
      'info': 'Pages',
      'widget': 'widget.booking.pageCount.toString()',
    },
  ];

  @override
  void initState() {
    tabControll = TabController(length: 3, vsync: this);
    super.initState();
  }

  // Function to launch a URL to read books
  Future<void> _launchUrl(String url) async {
    final Uri urll = Uri.parse(url);

    if (!await launchUrl(urll)) {
      throw Exception('Could not launch $urll');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
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
                widget.booking.imageLinks?.thumbnail ??
                    'https://images.unsplash.com/photo-1682687982423-295485af248a?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.booking.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
              subtitle: Text(widget.booking.authors.join()),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.secondaryColor,
                        border: Border.all(color: AppColor.buttonColor)),
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Released'),
                        Text(
                          (widget.booking.publishedDate ?? ''),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.secondaryColor,
                        border: Border.all(color: AppColor.buttonColor)),
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Rating'),
                        Text(
                          widget.booking.averageRating.toString(),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.secondaryColor,
                        border: Border.all(color: AppColor.buttonColor)),
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Pages'),
                        Text(widget.booking.pageCount.toString())
                      ],
                    ),
                  ),
                ),
              ],
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
                    text: 'Review',
                  ),
                  // Tab(
                  //   text: 'Review',
                  // )
                ]),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height,
              child: TabBarView(controller: tabControll, children: [
                Text(widget.booking.description ?? ''),

                // details tab
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Date Published: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          widget.booking.publishedDate ?? '',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Publisher: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          widget.booking.publisher ?? '',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Subtitle: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Expanded(
                          child: Text(
                            widget.booking.subtitle ?? 'N.A',
                            style: const TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Category: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          widget.booking.categories.join(),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Version: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          widget.booking.contentVersion ?? 'Not Available',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                // const Text('About the Author'),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    itemCount: 20,
                    itemBuilder: (_, i) {
                      return ListTile(
                        leading: ClipOval(
                          child: Image.network(
                              'https://th.bing.com/th/id/R.78fa48850540432f077acaa8cdfe1380?rik=vPZW0ic6039fog&pid=ImgRaw&r=0'),
                        ),
                        title: const Text('Name'),
                        subtitle: const Text(
                            'Users can drop a comment and give reviews about a book.'),
                      );
                    })
              ]),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: AppColor.secondaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    _launchUrl(widget.booking.previewLink ?? '');
                  },
                  icon: const Icon(
                    Iconsax.book,
                    color: AppColor.buttonColor_2,
                  ),
                  label: const Text(
                    'Start Reading',
                    style: TextStyle(color: AppColor.buttonColor_2),
                  )),
              const SizedBox(
                width: 20,
              ),
              GetBuilder<SavedBooksController>(
                  init: Get.put(SavedBooksController()),
                  builder: (controller) => ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.buttonColor_2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        controller.addSavedBook(widget.booking);
                        Get.dialog(
                          barrierDismissible: false,
                          AlertDialog(
                            backgroundColor: AppColor.buttonColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Column(
                              children: [
                                const Text(
                                  'Added to your\n Library!!!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  'assets/images/thumbsup.png',
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor: AppColor.buttonColor_2),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    'Okay',
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 14),
                                  ))
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Iconsax.document_download,
                        color: AppColor.primaryColor,
                      ),
                      label: const Text(
                        'Save Book',
                        style: TextStyle(color: AppColor.primaryColor),
                      )))
            ],
          )),
    );
  }
}
