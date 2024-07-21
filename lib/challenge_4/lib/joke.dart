import 'dart:convert';

Joke jokeFromJson(String str) => Joke.fromJson(json.decode(str));

String jokeToJson(Joke data) => json.encode(data.toJson());

class Joke {
  String type;
  String setup;
  String punchline;
  int id;

  Joke({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "setup": setup,
        "punchline": punchline,
        "id": id,
      };
}
