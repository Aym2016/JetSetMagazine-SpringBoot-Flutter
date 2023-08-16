import 'dart:convert';

FilmModel ModelJson(String str) => FilmModel.fromJson(json.decode(str));

String FilmModelToJson(FilmModel data) => json.encode(data.toJson());

class FilmModel {
  int id;
  String titre;
  int annee;
  String genre;
  String resume;

  FilmModel({this.id, this.titre, this.annee, this.genre, this.resume});

  factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
      titre: json["titre"],
      annee: json["annee"],
      genre: json["genre"],
      resume: json["resume"],
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "titre": titre,
        "annee": annee,
        "genre": genre,
        "resume": resume,
        'id': id,
      };

  String get titre1 => titre;

  int get annee1 => annee;

  String get genre1 => genre;
  String get resume1 => resume;
  int get id1 => id;
}
