import 'package:audio_books/views/explore/explore.dart';
import 'package:audio_books/views/homepage/home.dart';
import 'package:audio_books/views/profile/profile.dart';
import 'package:audio_books/views/savedbooks/save.dart';
import 'package:audio_books/controllers/bottomnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import '../constants/app_color.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  final controller = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            Home(),
            Explore(),
            SavedPage(
              
            ),
            Profile()
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: AppColor.secondaryColor,
            elevation: 8,
            onTap: controller.changeTabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.black,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    FeatherIcons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.compass), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.download), label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.settings), label: 'Settings')
            ],
          ),
        ),
      );
    });
  }
}
