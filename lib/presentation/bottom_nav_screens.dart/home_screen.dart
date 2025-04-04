import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loty_play/configs/sports_list.dart';
import 'package:loty_play/providers/theme_provider.dart';

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
              "Selecciona tu deporte",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
          ),
          _ScreenView(),
        ],
      ),
    );
  }
}

class _ScreenView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.60,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            for (final sport in sportsList)
              GestureDetector(
                onTap: () {
                  ref.read(selectedColorProvider.notifier).state = sportsList.indexOf(sport);
                  context.push(
                    sport.route,
                    extra: sport,
                  );
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
      ),
    );
  }
}
