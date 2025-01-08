import '../model/game.dart';
import 'games_data.dart';

List<Game> GameData = gameList.map((json) => Game.fromJson(json)).toList();
