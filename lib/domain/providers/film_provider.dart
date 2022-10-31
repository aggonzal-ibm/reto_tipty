import 'package:flutter/material.dart';

import '../../data/models/film.dart';
import '../services/film_service.dart';

class FilmProvider extends ChangeNotifier {
  String title = '';

  List<String> films = [];
  bool _isLoading = false;
  // ignore: avoid_init_to_null

  get getListFilms => this.films;
  set setListFilms(films) => this.films = films;

  get getTile => this.title;
  set setTitle(name) => this.title = title;

  bool get loading => _isLoading;
  void _setLoading(bool boolean) {
    _isLoading = boolean;
    notifyListeners();
  }

  Future getFilmList(List<String>? filmsUrl) async {
    notifyListeners();
    _setLoading(true);
    List<String> films = await FilmService.getFilmList(filmsUrl);
    this.films = films;

    _setLoading(false);
    notifyListeners();
  }
}
