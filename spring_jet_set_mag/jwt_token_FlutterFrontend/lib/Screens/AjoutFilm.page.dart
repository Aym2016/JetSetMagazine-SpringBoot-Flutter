import 'dart:convert';

import 'package:jwt_token/Model/FilmModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class registerFilm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerFilmState();
  }
}

Future<FilmModel> registerFilms(String titre, String annee, String genre,
    String resume, BuildContext context) async {
  var Url = "http://localhost:8080/addFilm";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "titre": titre,
        "annee": annee,
        "genre": genre,
        "resume": resume
      }));

  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Backend Response', content: response.body);
      },
    );
  }
}

class registerFilmState extends State<registerFilm> {
  final minimumPadding = 5.0;

  TextEditingController titreController = TextEditingController();
  TextEditingController anneeController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController resumeController = TextEditingController();

  FilmModel Film;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Film"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: anneeController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter the year';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'year',
                        hintText: 'Enter the year',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: titreController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your title';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Enter Your First Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              RaisedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    String titre = titreController.text;
                    String annee = anneeController.text;
                    String genre = genreController.text;
                    String resume = resumeController.text;
                    FilmModel Films = await registerFilms(
                        titre, annee, genre, resume, context);
                    titreController.text = '';
                    anneeController.text = '';
                    genreController.text = '';
                    resumeController.text = '';
                    setState(() {
                      Film = Films;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.title,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}
