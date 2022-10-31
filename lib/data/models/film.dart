// To parse this JSON data, do
//
//     final film = filmFromJson(jsonString);

import 'dart:convert';

class Film {
  String? title;

  Film({
    this.title,
  });

  factory Film.fromJson(String str) => Film.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Film.fromMap(Map<String, dynamic> json) => Film(
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
      };
}
