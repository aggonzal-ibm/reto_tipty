import 'package:flutter/material.dart';
import '../../../../data/models/film.dart';
import '../../../../data/models/people.dart';

class PeopleCard {
  Widget peopleDetailCard(People people, BuildContext context) {
    return SafeArea(
        child: Container(
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.indigo, width: 2)),
        margin: EdgeInsets.all(2),
        elevation: 10,
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              title: Text(
                'Name: ' + people.name! + ' ' + 'Gender: ' + people.gender!,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
