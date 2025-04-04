import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loty_play/configs/bottom_navigation_sport.dart';
import 'package:loty_play/providers/bottom_nav_bar_provider.dart';

class BottomNavBarBaseball extends ConsumerWidget {
  const BottomNavBarBaseball({
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(idxNavBarProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GNav(
        selectedIndex: index,
        color: Colors.blueGrey,
        activeColor: Colors.blueAccent,
        iconSize: 25,
        tabBackgroundColor: Colors.blue.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        tabs: [
          for(final menuItem in bottomNavSports)
            GButton(
              icon: menuItem.icon,
              text: menuItem.text,
              duration: const Duration(milliseconds: 400),
              onPressed: () {
              },
            ),
        ],
      ),
    );
  }
}