import 'package:flutter/material.dart';
import 'package:general/widgets/text.dart';

import '../../screens/main/edit_profile_screen.dart';
import '../helper/helper_widget.dart';
import 'clip_path_bg.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width / 1.10,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              const ClipPathBackground(height: 320),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomText(
                            'Jann Ray P. Mostajo',
                            color: Colors.white,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(height: 5),
                          CustomText(
                            '09466056362',
                            color: Colors.white,
                          ),
                          SizedBox(height: 5),
                          CustomText(
                            'Zone 4 Herra st.',
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rowBuilder(
                  'assets/image/eprofile.png',
                  'Edit Profile',
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileScreen()));
                  },
                ),
                rowBuilder(
                  'assets/image/ehotline.png',
                  'Hotline Number',
                  () {},
                ),
              ],
            ),
          ),
          rowBuilder(
            'assets/image/logout.png',
            'Logout',
            () {
              Navigator.pop(context);
            },
          )
        ]));
  }
}
