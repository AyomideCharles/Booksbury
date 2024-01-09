import 'package:audio_books/bottom_nav/bottom_nav.dart';
import 'package:audio_books/views/explore/explore.dart';
import 'package:audio_books/views/explore/widgets/bookinfo.dart';
import 'package:audio_books/views/homepage/home.dart';
import 'package:audio_books/views/profile/profile.dart';
import 'package:audio_books/views/savedbooks/save.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => NavBar()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: explore, page: () => const Explore()),
    GetPage(name: save, page: () =>    const SavedPage()),
    GetPage(name: profile, page: () => const Profile()),
    GetPage(
        name: bookinfo,
        page: () => BookInfo(
              booking: Get.arguments,
            )),
    // GetPage(name: search, page: () => const Search()),
  ];

  static getnavbar() => navbar;
  static gethome() => home;
  static getexplore() => explore;
  static getsave() => save;
  static getprofile() => profile;
  static getbookinfo() => bookinfo;
  // static getsearch() => search;

  static String navbar = '/';
  static String home = '/home';
  static String explore = '/explore';
  static String save = '/save';
  static String profile = '/profile';
  static String bookinfo = '/bookinfo';
  // static String search = '/bookinfo';
}
