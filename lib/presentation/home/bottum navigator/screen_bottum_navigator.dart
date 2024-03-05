import 'package:dating_vista/core/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigatorWidget extends StatelessWidget {
  const BottomNavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: indexChangeNotifier,
      builder: (context, newIndex, _) {
        return BottomNavigationBar(
          elevation: 0,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: newIndex,
          selectedItemColor: colorApp,
          unselectedItemColor: colorBlack.withOpacity(0.6),
          selectedIconTheme: const IconThemeData(color: colorApp),
          unselectedIconTheme:
              IconThemeData(color: colorBlack.withOpacity(0.6)),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        );
      },
    );
  }
}
