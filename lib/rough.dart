import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Book {
  final String title;
  final List<String> authors;

  Book({required this.title, required this.authors});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBookListWidget(),
    );
  }
}

class MyBookListWidget extends StatefulWidget {
  @override
  _MyBookListWidgetState createState() => _MyBookListWidgetState();
}

class _MyBookListWidgetState extends State<MyBookListWidget> {
  List<Book> books = [];
  List<Book> savedBooks = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final response = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=flutter'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['items'] != null) {
        setState(() {
          books = List<Book>.from(data['items'].map((item) {
            return Book(
              title: item['volumeInfo']['title'],
              authors: List<String>.from(item['volumeInfo']['authors'] ?? []),
            );
          }));
        });
      }
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedBooksPage(savedBooks: savedBooks),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(
                    book: books[index],
                    onSave: () {
                      setState(() {
                        savedBooks.add(books[index]);
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailPage extends StatelessWidget {
  final Book book;
  final VoidCallback onSave;

  BookDetailPage({required this.book, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              onSave(); // Call the provided onSave callback
              // Show a snackbar to indicate the book is saved
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Book saved!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display book details using Book properties
          Text('Title: ${book.title}'),
          Text('Authors: ${book.authors.join(', ')}'),
          // Add other details as needed
        ],
      ),
    );
  }
}

class SavedBooksPage extends StatelessWidget {
  final List<Book> savedBooks;

  SavedBooksPage({required this.savedBooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Books'),
      ),
      body: ListView.builder(
        itemCount: savedBooks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(savedBooks[index].title),
            // Add other details or actions related to saved books
          );
        },
      ),
    );
  }
}
