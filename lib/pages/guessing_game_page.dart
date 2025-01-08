import 'package:flutter/material.dart';
import 'games_list_page.dart';
import 'scores_page.dart';
import 'result_page.dart';
import '../model/game.dart';
import 'package:flutterproject/data/game_global.dart';

class GuessingGamePage extends StatefulWidget {
  const GuessingGamePage({super.key});

  @override
  State<GuessingGamePage> createState() => _GuessingGamePageState();
}

class _GuessingGamePageState extends State<GuessingGamePage> {
  late List<Game> options;
  late Game gameForDescription;

  @override
  void initState() {
    super.initState();
    _generateNewGameSession();
  }

  void _generateNewGameSession() {
    setState(() {
      options = (GameData..shuffle()).take(3).toList();
      gameForDescription = options.first; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guess the Game"),
        backgroundColor: const Color.fromARGB(255, 72, 39, 76),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backimg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Description: ${gameForDescription.shortDescription}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //option??.....
                  ...options.map((game) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  isCorrect: game == gameForDescription,
                                  game: gameForDescription,
                                  onPlayAgain: _generateNewGameSession,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 120, 97, 114),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            game.title ?? 'Unknown Title', //هنا غلط
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'homeButton',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GamesListPage(category: 'All')),
                    );
                  },
                  backgroundColor: const Color.fromARGB(255, 72, 39, 76),
                  child: const Icon(Icons.home),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'scoreButton',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScoresPage()),
                    );
                  },
                  backgroundColor: const Color.fromARGB(255, 72, 39, 76),
                  child: const Icon(Icons.score),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
