import 'package:flutter/material.dart';
import 'package:jwt_token/global/global.parameter.dart';
import 'package:jwt_token/pages/counter.page.dart';
import 'package:jwt_token/pages/home.page.dart';
import 'package:jwt_token/utils/color.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: GlobalParameters.routes,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 22, color: Colors.deepPurpleAccent),
          )),
    );
  }
}
