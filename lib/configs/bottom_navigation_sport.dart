import 'package:flutter/material.dart';

class BottomNavigationItem {
  final IconData icon;
  final String text;

  BottomNavigationItem({
    required this.icon,
    required this.text,
  });
}

List<BottomNavigationItem> bottomNavSports = [
  BottomNavigationItem(
    icon: Icons.sports_baseball,
    text: 'Juegos',
  ),
  BottomNavigationItem(
    icon: Icons.history,
    text: 'Historial',
  ),
  BottomNavigationItem(
    icon: Icons.analytics,
    text: 'Analisis',
  ),
];