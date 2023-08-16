import 'dart:convert';

CommentModel ModelJson(String str) => CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  int id;
  String texte;
  String date;

  CommentModel({this.id, this.texte, this.date});

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
      texte: json["texte_com"], date: json["date_com"], id: json["id"]);

  Map<String, dynamic> toJson() => {
        "texte_com": texte,
        "date_com": date,
        'id': id,
      };

  String get date1 => date;

  // int get 1 => annee;

  String get texte1 => texte;
  //String get resume1 => resume;
  int get id1 => id;
}
