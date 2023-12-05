import 'dart:convert';
import 'package:audio_books/services/api_service.dart';
import 'package:http/http.dart' as http;

// get request for popular books
Future<List<VolumeInfo>> fetchBooks(String query) async {
   const String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

      final response = await http.get(Uri.parse('$baseUrl?q=$query'));

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