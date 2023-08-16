import 'dart:convert';

rubriqueModel ModelJson(String str) => rubriqueModel.fromJson(json.decode(str));

String rubriqueModelToJson(rubriqueModel data) => json.encode(data.toJson());

class rubriqueModel {
  int id;
  String categorie;
  /*int annee;
  String genre;
  String resume;*/

  rubriqueModel({this.id, this.categorie});

  factory rubriqueModel.fromJson(Map<String, dynamic> json) =>
      rubriqueModel(categorie: json["categorie"], id: json["id"]);

  Map<String, dynamic> toJson() => {
        "categorie": categorie,
        'id': id,
      };

  String get categorie1 => categorie;

  int get id1 => id;

  /*String get genre1 => genre;
  String get resume1 => resume;
  int get id1 => id;*/
}
