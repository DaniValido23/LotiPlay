import 'package:flutter/material.dart';
import 'package:loty_play/configs/router.dart';

class Sport {
  final String name;
  final String image;
  final Color color;
  final String route;

  Sport({required this.name, required this.image, required this.color, required this.route});
}

List<Sport> sportsList = [
  Sport(
    name: 'Baseball',
    image: 'assets/images/baseball.png',
    color: Color.fromRGBO(64, 123, 255, 0.65),
    route: Routes.baseball,
  ),

  Sport(
    name: 'Basketball',
    image: 'assets/images/basketball.png',
    color: Color.fromRGBO(255, 114, 94, 0.65),
    route: Routes.basketball,
  ),

  Sport(
    name: 'Boxing',
    image: 'assets/images/box.png',
    color: Color.fromRGBO(186, 104, 200, 0.65),
    route: Routes.boxing,
  ),

  Sport(
    name: 'Futbol',
    image: 'assets/images/soccer.png',
    color: Color.fromRGBO(146, 227, 169, 0.65),
    route: Routes.futbol,
  ),
];
