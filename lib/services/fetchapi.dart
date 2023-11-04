import 'dart:convert';

import 'package:audio_books/services/api_service.dart';
import 'package:http/http.dart' as http;

// Future<VolumeInfo> fetchData() async {
//   final response = await http.get(url as Uri);

//   if (response.statusCode == 200) {
//     return VolumeInfo.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load post');
//   }
// }

// String url =
//     "https://www.googleapis.com/books/v1/volumes?q=greek&key=AIzaSyAWgSL7r9fDLOODB38fCCQ1vaIJKKaS5dE";

Future<List<VolumeInfo>> fetchBooks() async {
  final response = await http.get(Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=greek&key=AIzaSyAWgSL7r9fDLOODB38fCCQ1vaIJKKaS5dE'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> items = data['items'];

    return items.map((item) {
      return VolumeInfo.fromJson(item['volumeInfo']);
    }).toList();
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}
