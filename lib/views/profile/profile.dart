import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/app_color.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

List settings = [
  {'title': 'Notification', 'leading': Iconsax.notification},
  {'title': 'Privacy', 'leading': Icons.privacy_tip},
  {'title': 'Language', 'leading': Icons.language},
  {'title': 'Report a Problem', 'leading': Icons.report},
];

  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(Get.isDarkMode ? ThemeData.dark() : ThemeData.light());
  }

class _ProfileState extends State<Profile> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                
              });
            },
            leading: const Icon(FeatherIcons.moon),
            title: const Text('Dark Mode'),
            trailing: Switch(
                activeColor: AppColor.buttonColor,
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                }),
          ),
          const Divider(
            endIndent: 15,
            indent: 15,
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: settings.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(settings[index]['leading']),
                      title: Text(settings[index]['title']),
                      trailing: const Icon(FeatherIcons.arrowRight),
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                    )
                  ],
                );
              }),
        ],
      ),
    );
  }
}
