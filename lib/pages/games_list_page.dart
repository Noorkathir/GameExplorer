import 'package:flutter/material.dart';
import '../data/game_global.dart'; 
import 'game_details_page.dart'; 

class GamesListPage extends StatelessWidget {
  final String category;

  const GamesListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final filteredGames = GameData.where((game) => game.genre == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("$category Games"),
        backgroundColor: const Color.fromARGB(255, 72, 39, 76),
      ),
      body: filteredGames.isEmpty
          ? const Center(
              child: Text(
                "No games.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: filteredGames.length,
              itemBuilder: (context, index) {
                final game = filteredGames[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameDetailsPage(game: game),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.network(
                            game.thumbnail ?? '',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error, size: 80, color: Colors.grey);
                            },
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  game.title ?? 'Unknown Title', //غلط هنا
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(game.shortDescription ?? ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
