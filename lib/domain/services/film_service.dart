// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/models/film.dart';
import '../../data/models/people.dart';

class FilmService {
  FilmService._();

  static Future<List<String>> getFilmList(List<String>? filmsUrl) async {
    List<String>? film = [];

    for (final e in filmsUrl!) {
      //
      var currentElement = e;
      var response = await http.get(currentElement);
      var data = json.decode(response.body);
      var rest = data["title"];
      film.add(rest);
    }

    return film;
  }
}
