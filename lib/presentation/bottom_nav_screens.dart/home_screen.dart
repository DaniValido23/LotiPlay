import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loty_play/configs/carousel_sports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Selecciona un deporte",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          _ScreenView(),
        ],
      ),
    );
  }
}

class _ScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          for (final sport in sportsList)
            GestureDetector(
              onTap: () {
                context.push(sport.route);
              },

              child: Container(
                decoration: BoxDecoration(
                  color: sport.color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Expanded(child: Image.asset(sport.image, fit: BoxFit.cover))],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
