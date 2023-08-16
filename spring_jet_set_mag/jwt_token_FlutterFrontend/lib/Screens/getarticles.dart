import 'dart:convert';

import 'package:jwt_token/Model/ArticleModel.dart';
/*import 'package:Employee_Management/Screens/deleteEmployee.dart';
import 'package:Employee_Management/Screens/employeeDrawer.dart';
import 'package:Employee_Management/Screens/updateEmployees.dart';*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_token/ScreensUser/MyApp3.dart';

class getarticles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return getAllArticlesState();
  }
}

class getAllArticlesState extends State<getarticles> {
  var employess = List<ArticleModel>.generate(200, (index) => null);

  Future<List<ArticleModel>> getArticlees() async {
    var data =
        await http.get('http://localhost:30000/api/auth/restArticle/articles');
    var jsonData = json.decode(data.body);

    List<ArticleModel> articles = [];
    for (var e in jsonData) {
      ArticleModel article = new ArticleModel();
      article.id = e["id"];
      article.titre = e["titre"];
      article.description = e["description"];

      articles.add(article);
    }
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("All Article Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp3()));
          },
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getArticlees(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Icon(Icons.error)));
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('ID' +
                        '                            ' +
                        '' +
                        '       ' +
                        'titre' +
                        '                                      ' +
                        'description'),
                    subtitle: Text('${snapshot.data[index].id}' +
                        '                           '
                            '${snapshot.data[index].titre}' +
                        '                                   ' +
                        '${snapshot.data[index].description}'),
                    //'${snapshot.data[index].emailId}'),
                    /* onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },*/
                  );
                });
          },
        ),
      ),
    );
  }
}
