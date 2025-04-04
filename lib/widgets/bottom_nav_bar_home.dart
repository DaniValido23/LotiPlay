import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loty_play/configs/bottom_navigation_home.dart';
import 'package:loty_play/configs/router.dart';
import 'package:loty_play/providers/bottom_nav_bar_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
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
        iconSize: 24,
        tabBackgroundColor: Colors.blue.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        tabs: [
          for(final menuItem in bottomNavItems)
            GButton(
              icon: menuItem.icon,
              text: menuItem.text,
              duration: const Duration(milliseconds: 400),
              onPressed: () {
                if(menuItem.route == Routes.home) {
                  ref.read(idxNavBarProvider.notifier).state = 0;
                } else if(menuItem.route == Routes.settings) {
                  ref.read(idxNavBarProvider.notifier).state = 1;
                }
                context.push(menuItem.route);
              },
            ),
        ],
      ),
    );
  }
}