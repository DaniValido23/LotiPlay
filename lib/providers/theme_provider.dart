import 'package:flutter_riverpod/flutter_riverpod.dart';

final darkThemeProvider = StateProvider<bool>((ref) => false);
final selectedColorProvider = StateProvider<int>((ref) => 0);