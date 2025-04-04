import 'package:flutter/material.dart';
import 'package:loty_play/configs/sports_list.dart';
import 'package:loty_play/widgets/bottom_nav_bar_sports.dart';
import 'package:loty_play/models/data_sports.dart';

class SportScreen extends StatelessWidget {
  final Sport sport;

  const SportScreen({super.key, required this.sport});

  void _showAddGameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Añadir nuevo juego'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                TextField(
                  decoration: InputDecoration(labelText: 'Nombre Equipo 1'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Nombre Equipo 2'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Score Equipo 1'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Score Equipo 2'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Ubicación'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Candelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sport.title),
        backgroundColor: sport.color,
      ),
      body: SingleChildScrollView(
        child: SportDataGrid(sportType: sport.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddGameDialog(context);
        },
        backgroundColor: sport.color,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBarSport(color: sport.color,),
    );
  }
}

class SportDataGrid extends StatelessWidget {
  final String sportType;
  const SportDataGrid({super.key, required this.sportType});

  String _convertSportName(String name) {
    // In data_sports, "Soccer" is used, while "Futbol" is in sports_list
    if (name == 'Futbol') return 'Soccer';
    return name;
  }

  @override
  Widget build(BuildContext context) {
    final filteredData = sportsDataList
        .where((data) => data.sportType == _convertSportName(sportType))
        .toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8, // Adjust for better height/width ratio
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final item = filteredData[index];
        return Card(
          margin: const EdgeInsets.all(4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Use minimum space
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(item.imageUrl, height: 80, fit: BoxFit.fill),
                const SizedBox(height: 4),
                Text(
                  '${item.team1} vs ${item.team2}',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(
                  'Score: ${item.score1} - ${item.score2}',
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Location: ${item.location}',
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}