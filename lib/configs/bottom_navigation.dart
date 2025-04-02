import 'package:flutter/material.dart';
import 'package:loty_play/configs/router.dart';

class BottomNavigationItem {
  final IconData icon;
  final String text;
  final String route;

  BottomNavigationItem({
    required this.icon,
    required this.text,
    required this.route,
  });
}

List<BottomNavigationItem> bottomNavItems = [
  BottomNavigationItem(
    icon: Icons.home,
    text: 'Deportes',
    route: Routes.home,
  ),
  BottomNavigationItem(
    icon: Icons.settings,
    text: 'Configuración',
    route: Routes.settings,
  ),
];