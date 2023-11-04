import 'package:audio_books/views/explore/explore.dart';
import 'package:audio_books/views/homepage/home.dart';
import 'package:audio_books/bottom_nav/profile.dart';
import 'package:audio_books/bottom_nav/save.dart';
import 'package:audio_books/controllers/bottomnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
          children: const [Home(), Explore(), SavedPage(), Profile()],
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: AppColor.secondaryColor,
            elevation: 8,
            onTap: controller.changeTabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.black,
            currentIndex: controller.tabIndex,
            // fixedColor: AppColor.buttonColor_2,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.home4,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.presention_chart), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.save_2), label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.profile_add), label: 'Profile')
            ],
          ),
        ),
      );
    });
  }
}
