import 'package:flutter/material.dart';

import '../../data/models/film.dart';
import '../../data/models/people.dart';
import '../services/people_service.dart';

class PeopleProvider extends ChangeNotifier {
  String name = '';
  String gender = '';
  bool _isLoading = false;
  List<Film> films = [];

  String genderSelected = '';
  // ignore: avoid_init_to_null
  PeopleProvider() {
    getPeopleList('');
  }

  late People _people;

  get people => _people;

  List<People> listPeople = [];

  bool get loading => _isLoading;

  get getListPeople => this.listPeople;
  set setListPeople(listPeople) => this.listPeople = listPeople;

  get getListFilms => this.films;
  set setListFilms(films) => this.films = films;

  get getName => this.name;
  set setName(name) => this.name = name;

  get getGender => this.gender;
  set setGender(gender) => this.gender = gender;

  get getGenderSelected => this.genderSelected;
  set setGenderSelectd(gender) => this.gender = genderSelected;
  void _setLoading(bool boolean) {
    _isLoading = boolean;
    notifyListeners();
  }

  void setGenderSelected(String gender) {
    genderSelected = gender;
    getPeopleList(gender);
    notifyListeners();
  }

  void _setPeople(People people) {
    _people = people;
  }

  Future getPeopleList(String gender) async {
    _setLoading(true);
    List<People> peoples = await PeopleService.getPeopleList();
    People people = People();
    List<People> peoplesFiltered = [];

    if (gender == 'male') {
      for (int i = 0; i < peoples.length; i++) {
        if (peoples[i].gender == 'male') {
          people = peoples[i];
          peoplesFiltered.add(people);
        }
      }

      this.listPeople = peoplesFiltered;
    } else if (gender == 'female') {
      for (int i = 0; i < peoples.length; i++) {
        if (peoples[i].gender == 'female') {
          people = peoples[i];
          peoplesFiltered.add(people);
        }
      }

      this.listPeople = peoplesFiltered;
    } else if (gender == 'n/a') {
      for (int i = 0; i < peoples.length; i++) {
        if (peoples[i].gender == 'n/a') {
          people = peoples[i];
          peoplesFiltered.add(people);
        }
      }

      this.listPeople = peoplesFiltered;
    } else {
      this.listPeople = peoples;
    }

    _setLoading(false);
    notifyListeners();
  }
}
