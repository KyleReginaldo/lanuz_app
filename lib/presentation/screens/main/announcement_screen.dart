import 'package:flutter/material.dart';
import 'package:general/widgets/text.dart';

import '../../widgets/custom/clip_path_bg.dart';
import '../../widgets/helper/helper_widget.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomHomeContainer(height: double.infinity),
        Center(
          child: Container(
            height: 600,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      'Emergency hotline numbers'.toUpperCase(),
                      weight: FontWeight.w700,
                      size: 14,
                      color: Colors.red,
                    ),
                  ),
                ),
                containerBuilder(
                  'assets/image/mddrmo.png',
                  'MDDRMO\nRESCUE:',
                  '0963-121-4877\n(086)-2128208',
                ),
                containerBuilder(
                  'assets/image/pnp.png',
                  'PNP\nLANUZA:',
                  '0939-917-3645\n0998-598-7367',
                ),
                containerBuilder(
                  'assets/image/bfp.png',
                  'BFP\nLANUZA:',
                  '0931-721-8762\n0955-214-8436',
                ),
                containerBuilder(
                  'assets/image/rhu.png',
                  'RHU\nLANUZA:',
                  '0968-570-4248\n0946-660-6456',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
