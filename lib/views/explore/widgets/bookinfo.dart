import 'package:audio_books/services/api_service.dart';
import 'package:flutter/material.dart';
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
    {'info': 'Released'},
    {'info': 'Part'},
    {'info': 'Pages'},
  ];

  @override
  void initState() {
    tabControll = TabController(length: 4, vsync: this);
    super.initState();
  }

  // final Uri _url = Uri.parse('https://github.com');

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

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
                widget.booking.imageLinks!.thumbnail ?? '',
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
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
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
                        Text(
                          widget.booking.subtitle ?? '',
                        ),
                      ],
                    ),
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
                    _launchUrl(widget.booking.previewLink);
                    // _launchUrl();
                    // there's going to be a url launcher here for the books
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
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonColor_2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    // there's going to be a function to save books here
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
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: AppColor.buttonColor_2),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'Okay',
                                style: TextStyle(
                                    color: AppColor.primaryColor, fontSize: 14),
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
                  ))
            ],
          )),
    );
  }

  /// Function to launch a URL.
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);

    if (!await launch(_url.toString())) {
      throw Exception('Could not launch $url');
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../constants/app_color.dart';
// import '../../../services/api_service.dart';

// /// Widget displaying detailed information about a book.
// class BookInfo extends StatefulWidget {
//   final VolumeInfo booking;

//   const BookInfo({Key? key, required this.booking}) : super(key: key);

//   @override
//   State<BookInfo> createState() => _BookInfoState();
// }

// class _BookInfoState extends State<BookInfo> with TickerProviderStateMixin {
//   late TabController tabController;

//   // Information to be displayed on cards
//   List<Map<String, String>> cardInfo = [
//     {'info': 'Released'},
//     {'info': 'Part'},
//     {'info': 'Pages'},
//   ];

//   @override
//   void initState() {
//     tabController = TabController(length: 4, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.secondaryColor,
//         title: const Text('Book Info'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             children: [
//               // Book Cover Image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.network(
//                   widget.booking.imageLinks?.thumbnail ?? '',
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height * 0.3,
//                   fit: BoxFit.fill,
//                   filterQuality: FilterQuality.high,
//                 ),
//               ),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 title: Text(
//                   widget.booking.title,
//                   style: const TextStyle(fontWeight: FontWeight.w500),
//                 ),
//                 subtitle: Text(widget.booking.authors.join()),
//               ),
//               // Display information on cards
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(3, (index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: AppColor.secondaryColor,
//                       border: Border.all(color: AppColor.buttonColor),
//                     ),
//                     width: 100,
//                     height: 50,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(cardInfo[index]['info']!),
//                         Text(
//                           widget.booking.pageCount.toString(),
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 }),
//               ),
//               // Display tabs for different information
//               TabBar(
//                 indicatorColor: Colors.black,
//                 unselectedLabelColor: Colors.grey,
//                 labelColor: Colors.black,
//                 controller: tabController,
//                 tabs: const [
//                   Tab(text: 'Sypnosis'),
//                   Tab(text: 'Details'),
//                   Tab(text: 'Author'),
//                   Tab(text: 'Review'),
//                 ],
//               ),
//               // Display tab views
//               Container(
//                 padding: const EdgeInsets.only(top: 10),
//                 height: MediaQuery.of(context).size.height,
//                 child: TabBarView(
//                   controller: tabController,
//                   children: [
//                     Text(widget.booking.description ?? ''),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             const Text('Date: '),
//                             Text(widget.booking.publishedDate),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             const Text('Publisher: '),
//                             Text(widget.booking.publisher ?? ''),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             const Text('Subtitle: '),
//                             Text(widget.booking.subtitle ?? ''),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const Text('tab 3 view'),
//                     const Text('tab 4 view'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         elevation: 0,
//         color: AppColor.secondaryColor,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Button to start reading the book
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColor.buttonColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               onPressed: () {
//                 _launchUrl(widget.booking.previewLink);
//               },
//               icon: const Icon(
//                 Iconsax.book,
//                 color: AppColor.buttonColor_2,
//               ),
//               label: const Text(
//                 'Start Reading',
//                 style: TextStyle(color: AppColor.buttonColor_2),
//               ),
//             ),
//             const SizedBox(width: 20),
//             // Button to save the book
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColor.buttonColor_2,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               onPressed: () {
//                 // Function to save the book goes here
//                 _showConfirmationDialog();
//               },
//               icon: const Icon(
//                 Iconsax.document_download,
//                 color: AppColor.primaryColor,
//               ),
//               label: const Text(
//                 'Save Book',
//                 style: TextStyle(color: AppColor.primaryColor),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Function to launch a URL.
//   Future<void> _launchUrl(String url) async {
//     final Uri _url = Uri.parse(url);

//     if (!await launch(_url.toString())) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   /// Function to show a confirmation dialog when saving the book.
//   void _showConfirmationDialog() {
//     Get.dialog(
//       barrierDismissible: false,
//       AlertDialog(
//         backgroundColor: AppColor.buttonColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         title: Column(
//           children: [
//             const Text(
//               'Added to your\n Library!!!',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 20),
//             Image.asset('assets/images/thumbsup.png'),
//           ],
//         ),
//         actions: [
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               backgroundColor: AppColor.buttonColor_2,
//             ),
//             onPressed: () {
//               Get.back();
//             },
//             child: const Text(
//               'Okay',
//               style: TextStyle(color: AppColor.primaryColor, fontSize: 14),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
