class Game {
  int? id;
  String? thumbnail;
  String? title;
  String? shortDescription;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freeToGameProfileUrl;

  Game({
    this.id,
    this.thumbnail,
    this.title,
    this.shortDescription,
    this.gameUrl,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.releaseDate,
    this.freeToGameProfileUrl,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      thumbnail: json['thumbnail'],
      title: json['title'],
      shortDescription: json['short_description'],
      gameUrl: json['game_url'],
      genre: json['genre'],
      platform: json['platform'],
      publisher: json['publisher'],
      developer: json['developer'],
      releaseDate: json['release_date'],
      freeToGameProfileUrl: json['freetogame_profile_url'],
    );
  }
}
