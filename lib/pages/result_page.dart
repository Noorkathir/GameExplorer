import 'package:flutter/material.dart';
import 'package:flutterproject/model/game.dart';
import '../model/game.dart';
import 'scores_page.dart';

class ResultPage extends StatelessWidget {
  final bool isCorrect;
  final Game game;
  final VoidCallback onPlayAgain;

  const ResultPage({
    super.key,
    required this.isCorrect,
    required this.game,
    required this.onPlayAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backimg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isCorrect
                          ? const Color.fromARGB(255, 79, 109, 80).withOpacity(0.8)
                          : const Color.fromARGB(255, 92, 52, 49).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isCorrect ? Icons.sentiment_satisfied_alt : Icons.sentiment_dissatisfied_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          isCorrect ? "Correct!" : "Wrong!",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title: ${game.title}", style: const TextStyle(fontSize: 16)),
                        Text("Description: ${game.shortDescription}",
                            style: const TextStyle(fontSize: 16)),
                        Text("Genre: ${game.genre}", style: const TextStyle(fontSize: 16)),
                        Text("Platform: ${game.platform}", style: const TextStyle(fontSize: 16)),
                        Text("Publisher: ${game.publisher}", style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
      
                  ElevatedButton(
                    onPressed: () {
                      onPlayAgain();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 72, 39, 76),
                    ),
                    child: const Text("Go Back to Game"),
                  ),
                ],
              ),
            ),
        
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                heroTag: 'scoreboardButton',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScoresPage()),
                  );
                },
                backgroundColor: const Color.fromARGB(255, 72, 39, 76),
                child: const Icon(Icons.score),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
