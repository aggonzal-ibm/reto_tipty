import 'package:flutter/material.dart';

class ShowDialogFilm {
  Widget setupAlertDialoadContainer(List<String> films, BuildContext context) {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: films.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(films[index]),
          );
        },
      ),
    );
  }
}
