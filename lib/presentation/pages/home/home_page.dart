import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_tipty/presentation/pages/home/widgets/people_card_widget.dart';
import 'package:reto_tipty/presentation/pages/home/widgets/show_dialog_film.dart';

import '../../../domain/providers/film_provider.dart';
import '../../../domain/providers/people_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _Home(),
    );
  }
}

enum Gender { male, female, na }

// ignore: must_be_immutable
class _Home extends StatelessWidget {
  PeopleCard card = PeopleCard();
  ShowDialogFilm filmByActor = ShowDialogFilm();

  @override
  Widget build(BuildContext context) {
    final PeopleProvider peopleProvider = Provider.of<PeopleProvider>(context);
    final FilmProvider filmProvider = Provider.of<FilmProvider>(context);

    return Container(
        padding: EdgeInsets.all(50),
        alignment: Alignment.bottomCenter,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            _flutterLogo(),
            _selectgender(peopleProvider),
            _peopleStarWars(peopleProvider, filmProvider),
          ],
        ));
  }

  Widget _peopleStarWars(
      PeopleProvider peopleProvider, FilmProvider filmProvider) {
    return Container(
      width: 400,
      height: 300,
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: peopleProvider.getListPeople.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                print(filmProvider.getListFilms);
                filmProvider
                    .getFilmList(peopleProvider.getListPeople[index].films);
                print(filmProvider.getListFilms);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Movies by Actor'),
                        content: filmByActor.setupAlertDialoadContainer(
                            filmProvider.films, context),
                      );
                    });
              },
              child: !peopleProvider.loading
                  ? card.peopleDetailCard(
                      peopleProvider.getListPeople[index], context)
                  : Container()),
        ),
      ),
    );
  }

  FlutterLogo _flutterLogo() {
    return const FlutterLogo(
      size: 100,
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget _selectgender(PeopleProvider peopleProvider) {
    String? gender;

    return Container(
      child: Column(
        children: <Widget>[
          RadioListTile(
            title: Text("Male"),
            value: "male",
            groupValue: gender,
            onChanged: (value) {
              peopleProvider.genderSelected = value.toString();
              peopleProvider.setGenderSelected(value.toString());
            },
          ),
          RadioListTile(
            title: Text("Female"),
            value: "female",
            groupValue: gender,
            onChanged: (value) {
              peopleProvider.genderSelected = value.toString();
              peopleProvider.setGenderSelected(value.toString());
            },
          ),
          RadioListTile(
            title: Text("N/a"),
            value: "n/a",
            groupValue: gender,
            onChanged: (value) {
              peopleProvider.genderSelected = value.toString();
              peopleProvider.setGenderSelected(value.toString());
            },
          ),
          RadioListTile(
            title: Text("All"),
            value: "all",
            groupValue: gender,
            onChanged: (value) {
              peopleProvider.genderSelected = value.toString();
              peopleProvider.setGenderSelected('');
            },
          )
        ],
      ),
    );
  }
}
