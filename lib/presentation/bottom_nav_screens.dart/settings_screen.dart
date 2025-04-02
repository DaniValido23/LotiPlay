import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _SettingsView();
    
  }
}

class _SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  title: const Text("Notificaciones"),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                ListTile(
                  title: const Text("Idioma"),
                  trailing: DropdownButton<String>(
                    value: 'Español',
                    items: <String>['Español', 'Inglés'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
