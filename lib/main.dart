import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_tipty/domain/providers/film_provider.dart';
import 'package:reto_tipty/domain/providers/people_provider.dart';

import 'package:reto_tipty/presentation/pages/home/home_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PeopleProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FilmProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',
          routes: {
            'home': (_) => Home(),
          },
        ));
  }
}
