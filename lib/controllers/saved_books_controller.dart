import 'package:audio_books/services/api_service.dart';
import 'package:get/get.dart';

class SavedBooksController extends GetxController {
   List<VolumeInfo> savedBooks = [];
   
  void addSavedBook(VolumeInfo book) {
    savedBooks.add(book);
    update();
  }

  void removeSavedBook(VolumeInfo book) {
    savedBooks.remove(book);
    update();
  }
}
