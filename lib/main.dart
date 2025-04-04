import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loty_play/configs/router.dart';
import 'package:loty_play/configs/theme.dart';
import 'package:loty_play/providers/theme_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkMode = ref.watch(darkThemeProvider);
    final int selectedColor = ref.watch(selectedColorProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode).getTheme(),
      routerConfig: router,
    );
  }
}
