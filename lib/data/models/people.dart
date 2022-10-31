// To parse this JSON data, do
//
//     final people = peopleFromJson(jsonString);

import 'dart:convert';

People peopleFromJson(String str) => People.fromJson(json.decode(str));

String peopleToJson(People data) => json.encode(data.toJson());

class People {
  People({
    this.name,
    this.gender,
    this.films,
  });

  String? name;
  String? gender;
  List<String>? films;

  factory People.fromJson(Map<String, dynamic> json) => People(
        name: json["name"],
        gender: json["gender"],
        films: List<String>.from(json["films"].map((x) => x)),
      );

  static List<People> fromJsonList(List<dynamic> jsonList) {
    List<People> toList = [];

    jsonList.forEach((item) {
      People novedad = People.fromJson(item);
      toList.add(novedad);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "films": List<dynamic>.from(films!.map((x) => x)),
      };
}
