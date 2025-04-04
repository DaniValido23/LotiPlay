import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loty_play/providers/theme_provider.dart';
import 'package:loty_play/providers/commission_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _SettingsView();
    
  }
}

class _SettingsView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkMode = ref.watch(darkThemeProvider);

    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Configuración",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Modo Oscuro"),
                  trailing: Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      ref.read(darkThemeProvider.notifier).state = !isDarkMode;
                    },
                  ),
                ),
                const CommissionSlider(),
                
              ],
            ),
          )
        ],
      )
    );
  }
}

class CommissionSlider extends ConsumerWidget {
  const CommissionSlider({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final double commission = ref.watch(commissionProvider);

    return ListTile(
      title: const Text("Comisión"),
      subtitle: Slider(
        value: commission,
        min: 0.0,
        max: 50.0,
        divisions: 10,
        label: "${commission.round()}%",
        onChanged: (value) {
          ref.read(commissionProvider.notifier).state = value;
        },
      ),
      trailing: Text("${commission.round()}%", style: const TextStyle(fontSize: 20)),
    );
  }
}
