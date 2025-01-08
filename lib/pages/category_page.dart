import 'package:flutter/material.dart';
import '../data/games_data.dart'; 
import 'games_list_page.dart'; 

class CategoriesPage extends StatelessWidget {
   CategoriesPage({super.key});

  final List<Map<String, dynamic>> categories = [
    {"name": "MMORPG", "icon": Icons.group},
    {"name": "Shooter", "icon": Icons.sports_esports},
    {"name": "Strategy", "icon": Icons.calculate},
    {"name": "Battle Royale", "icon": Icons.sports_kabaddi},
    {"name": "Action RPG", "icon": Icons.military_tech}, 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Games genre"),
        backgroundColor: const Color.fromARGB(255, 72, 39, 76),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backimg.jpeg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GamesListPage(
                      category: category["name"],
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      category["icon"],
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      category["name"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
