import 'package:flutterproject/model.dart/player.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class Database {
  final supabase = Supabase.instance.client;


  Future<bool> isPlayerExists(String name, int id) async {
    final response = await supabase
        .from("flutterproject")
        .select()
        .eq("player_name", name)
        .eq("player_id", id)
        .maybeSingle();

    return response != null;
  }


  Future<void> addPlayer(String name, int id) async {
    final response = await supabase.from("flutterproject").insert({
      "player_name": name,
      "player_id": id,
      "player_score": 0,
    });

    if (response.error != null) {
      throw Exception("Error adding player: ${response.error?.message}");
    }
  }


  Future<void> incrementScore(int id) async {
    final response = await supabase
        .from("flutterproject")
        .select("player_score")
        .eq("player_id", id)
        .maybeSingle();

    if (response != null) {
      final currentScore = response['player_score'] as int? ?? 0;
      await supabase.from("flutterproject").update({
        "player_score": currentScore + 1,
      }).eq("player_id", id);
    } else {
      throw Exception(" not found");
    }
  }

Future<List<Player>> getAllPlayers() async {
  try {
    final response = await supabase.from("flutterproject").select();

    
    if (response != null && response is List) {
      return (response as List)
          .map((json) => Player.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception("invalid response.");
    }
  } catch (e) {
    print("Error find players: $e");
    throw Exception("Failed to find players: $e");
  }
}

}
