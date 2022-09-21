import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:general/widgets/text.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../core/theme/color.dart';

class CustomBubbleBar extends StatelessWidget {
  final int currentIndex;
  final Function(int?)? onTap;
  const CustomBubbleBar({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: currentIndex,
      onTap: onTap,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,
      hasNotch: false, //new
      items: [
        BubbleBottomBarItem(
            backgroundColor: Colors.purpleAccent.shade200.withOpacity(0.4),
            icon: const Iconify(Mdi.map_marker, color: PRIMARY_COLOR),
            activeIcon: const Iconify(Mdi.map_marker, color: BLACK),
            title: const CustomText("Map", color: BLACK)),
        BubbleBottomBarItem(
            backgroundColor: Colors.purpleAccent.shade200.withOpacity(0.4),
            icon: const Iconify(Ic.baseline_home, color: PRIMARY_COLOR),
            activeIcon: const Iconify(Ic.baseline_home, color: BLACK),
            title: const CustomText("Home", color: BLACK)),
        BubbleBottomBarItem(
            backgroundColor: Colors.purpleAccent.shade200.withOpacity(0.4),
            icon: const Iconify(Ion.ios_megaphone, color: PRIMARY_COLOR),
            activeIcon: const Iconify(Ion.ios_megaphone, color: BLACK),
            title: const CustomText("Announcement", color: BLACK)),
      ],
    );
  }
}
