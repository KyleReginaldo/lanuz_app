import 'package:flutter/material.dart';

import '../widgets/custom/bubble_bottom_bar.dart';
import '../widgets/custom/drawer.dart';
import 'main/announcement_screen.dart';
import 'main/home_screen.dart';
import 'main/map_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  final List screen = [
    const MapScreen(),
    const HomeScreen(),
    const AnnouncementScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const CustomDrawer(),
        appBar: AppBar(),
        body: screen[currentIndex],
        bottomNavigationBar: CustomBubbleBar(
          currentIndex: currentIndex,
          onTap: changePage,
        ));
  }
}
