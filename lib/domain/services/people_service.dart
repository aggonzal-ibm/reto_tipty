// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/models/people.dart';

class PeopleService {
  PeopleService._();

  static Future<List<People>> getPeopleList() async {
    final response = await http.get('https://swapi.dev/api/people/');
    var data = json.decode(response.body);

    var rest = data["results"] as List;

    print(rest);
    List<People> peoples = People.fromJsonList(rest);

    return peoples;
  }
}
