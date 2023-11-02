import 'package:audio_books/model/popularbooks_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../../services/api_service.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  Future<VolumeInfo?>? volumeinfo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: volumeinfo,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          final data = snapshot.data;
          return ListView.builder(
              primary: F,
              itemCount: popular.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(popular[index].image),
                  ),
                  title: Text(
                    popular[index].title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(popular[index].author),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    // return ListView.builder(
    //     primary: F,
    //     itemCount: popular.length,
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         contentPadding: EdgeInsets.zero,
    //         leading: ClipRRect(
    //           borderRadius: BorderRadius.circular(10),
    //           child: Image.network(popular[index].image),
    //         ),
    //         title: Text(
    //           popular[index].title,
    //           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    //         ),
    //         subtitle: Text(popular[index].author),
    //       );
    //     });
  }
}


// body: FutureBuilder(
//         future: volumeinfo,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasData) {
//             final data = snapshot.data;
//             return ListView(
//               padding: const EdgeInsets.all(15),
//               children: const [
//                 HomeCard(),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Text(
//                   'Popular Books',
//                   style: TextStyle(fontSize: 25),
//                 ),
//                 HomeList()
//               ],
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
