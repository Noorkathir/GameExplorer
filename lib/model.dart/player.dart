class Player {
  int? id;
  String? name;
  int? score;

  Player({this.id, this.name, this.score});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json["player_id"],
      name: json["player_name"],
      score: json["player_score"],
    );
  }
}
