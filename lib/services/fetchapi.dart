import 'dart:convert';
import 'package:audio_books/services/api_service.dart';
import 'package:http/http.dart' as http;


// GET Api Request
Future<VolumeInfo> fetchData() async {
  final uri = Uri.parse(
      "https://www.googleapis.com/books/v1/volumes?q=greek&key=AIzaSyAWgSL7r9fDLOODB38fCCQ1vaIJKKaS5dE");
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return VolumeInfo.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}


// POST Api Request
Future<VolumeInfo> createData() async {
    final uri = Uri.parse(
      "https://www.googleapis.com/books/v1/volumes?q=greek&key=AIzaSyAWgSL7r9fDLOODB38fCCQ1vaIJKKaS5dE");
  final response = await http.post(uri);

  if (response.statusCode == 201) {
    return VolumeInfo.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
