import 'dart:convert';

ArticleModel articleModelJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  int id;
  String titre;
  String description;
  // String emailId;

  ArticleModel({this.id, this.titre, this.description});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      titre: json["titre"], description: json["description"], id: json["id"]);

  Map<String, dynamic> toJson() => {
        "titre": titre,
        "description": description,
        'id': id,
      };

  String get titre1 => titre;

  String get description1 => description;
}
