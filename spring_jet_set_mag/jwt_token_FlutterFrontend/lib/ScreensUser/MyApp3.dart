import 'package:flutter/material.dart';

//void main() => runApp(new MyApp());

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Article images',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Article image'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(this.title),
        ),
        body: new Column(children: <Widget>[
          ArticleWidget("gentelmen", "givency",
              "https://www.jetsetmagazine.net/__admin/image.php?width=400&height=300&cropratio=4:3&nocache&image=https://www.jetsetmagazine.net//__admin/__admin_medias/modules/home/banner/2021/06juin/givenchygentelmandiapo.jpg"),
          ArticleWidget("mood", "",
              "https://www.jetsetmagazine.net/__admin/image.php?width=400&height=300&cropratio=4:3&nocache&image=https://www.jetsetmagazine.net//__admin/__admin_medias/modules/home/banner/2021/06juin/moods18diapo.jpg"),
          ArticleWidget("chiara", "Ferragini",
              "https://www.jetsetmagazine.net/__admin/image.php?width=400&height=300&cropratio=4:3&nocache&image=https://www.jetsetmagazine.net//__admin/__admin_medias/modules/home/banner/2021/mai/diapoNespresso-Chiara-Ferragni.jpg"),
        ]));
  }
}

class ArticleWidget extends StatelessWidget {
  ArticleWidget(this.make, this.model, this.imageSrc) : super();

  final String make;

  final String model;

  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text(make),
      Text(model),
      Image.network(imageSrc)
    ]));
  }
}
