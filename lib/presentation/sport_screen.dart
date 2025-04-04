import 'package:flutter/material.dart';
import 'package:loty_play/configs/carousel_sports.dart';

class SportScreen extends StatelessWidget {
  final Sport sport;

  const SportScreen({super.key, required this.sport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sport.title),
        backgroundColor: sport.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(sport.image, height: 200),
            const SizedBox(height: 20),
            Text(
              sport.title,
              style: TextStyle(fontSize: 24, color: sport.color),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        backgroundColor: sport.color,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}