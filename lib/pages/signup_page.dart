import 'package:flutter/material.dart';
import 'login_page.dart';
import 'list_page.dart';
import '../services/database.dart'; 

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController playerIdController = TextEditingController();
  final TextEditingController playerNameController = TextEditingController();
  bool obscureText = true;

  final Database db = Database(); 

  @override
  void dispose() {
    playerIdController.dispose();
    playerNameController.dispose();
    super.dispose();
  }

  Future<void> handleSignup() async {
    final String playerIdText = playerIdController.text.trim();
    final String playerName = playerNameController.text.trim();

    if (playerIdText.isEmpty || playerName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill out all fields.")),
      );
      return;
    }

    try {
      final int playerId = int.parse(playerIdText);

      // Check if the player already exists
      final bool exists = await db.isPlayerExists(playerName, playerId);

      if (exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Player already exists.")),
        );
      } else {
       
        await db.addPlayer(playerName, playerId);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup successful!")),
        );

    
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ListPage()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 97, 114),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 39, 76),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Signup",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: playerIdController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Enter Player ID",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: playerNameController,
              obscureText: obscureText,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Enter Player Name",
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "If you already have an account, ",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Color.fromARGB(255, 62, 41, 54),
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: handleSignup, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 67, 34, 78),
              ),
              child: const Text(
                "Signup",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
