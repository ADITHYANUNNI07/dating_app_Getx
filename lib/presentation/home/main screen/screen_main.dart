import 'package:dating_vista/presentation/home/bottum%20navigator/screen_bottum_navigator.dart';
import 'package:dating_vista/presentation/home/explore/screen_explore.dart';
import 'package:dating_vista/presentation/home/profile/screen_profile.dart';
import 'package:dating_vista/presentation/home/search/screen_search.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatelessWidget {
  MainPageScreen({super.key});

  final pages = [
    const ExploreScreen(),
    const SearchScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: indexChangeNotifier,
        builder: (context, index, child) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigatorWidget(),
    );
  }
}
