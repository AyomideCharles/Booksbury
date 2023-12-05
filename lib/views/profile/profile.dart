import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

List settings = [
  {'title': 'Dark Mode', 'leading': FeatherIcons.moon},
  {'title': 'Notification', 'leading': Iconsax.notification},
  {'title': 'Privacy', 'leading': Icons.privacy_tip},
  {'title': 'Language', 'leading': Icons.language},
  {'title': 'Report a Problem', 'leading': Icons.report},
];

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(settings[index]['leading']),
                    title: Text(settings[index]['title']),
                    trailing: const Icon(FeatherIcons.navigation),
                  ),
                  const Divider(
                    endIndent: 15,
                    indent: 15,
                  )
                ],
              );
            }),
      ),
    );
  }
}
