import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterproject/pages/category_page.dart';
import 'package:flutterproject/pages/guessing_game_page.dart';
import 'package:flutterproject/pages/list_page.dart';
import 'package:flutterproject/pages/login_page.dart';
import 'package:flutterproject/pages/scores_page.dart';
import 'package:flutterproject/pages/signup_page.dart';

import 'package:supabase_flutter/supabase_flutter.dart'; 
import 'pages/welcome_page.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['supabaseUrl']!, 
    anonKey: dotenv.env['supabaseKey']!, 
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: WelcomePage(),
    );
  }
}
//flutter run -d chrome --web-renderer html
//شغليه فيه عشان الصور