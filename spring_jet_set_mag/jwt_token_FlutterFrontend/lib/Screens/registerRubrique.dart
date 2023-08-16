import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_token/utils/color.dart';
import 'package:jwt_token/widgets/btn_widget.dart';
import 'package:jwt_token/widgets/herder_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'package:jwt_token/widgets/header_container.dart';

class RegRubrique extends StatefulWidget {
  @override
  _RegRubState createState() => _RegRubState();
}

class _RegRubState extends State<RegRubrique> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController categorieController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  save(String categorie) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String roles;
    Map data = {"categorie": categorie};

    print(data);
    var jsonResponse = null;
    Map<String, String> headers = {"Content-Type": "application/json"};

    final msg = jsonEncode({"categorie": categorie});

    var response = await http.post(
        "http://localhost:30000/api/restRubrique/rubriques",
        body: msg,
        headers: headers);
    jsonResponse = json.decode(response.body);
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer(" add rubrique"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput1(hint: "categorie", icon: Icons.category),
                    //_textInput(hint: "Phone Number", icon: Icons.call),
                    /*_textInput2(hint: "Password", icon: Icons.vpn_key),
                    _textInput(hint: "username", icon: Icons.person),*/

                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER",
                          onClick: () {
                            Navigator.pop(context);
                            save(
                              categorieController.text,
                            );
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "", style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "", style: TextStyle(color: orangeColors)),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  Widget _textInput1({hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: categorieController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  Widget _textInput2({hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        //controller: passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}

/*import 'dart:convert';

//import 'package:jwt_token/Model/RubriqueModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class registerRubrique extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerrubriqueState();
  }
}

Future<rubriqueModel> registerrubriques(String firstName, String lastName,
    String emailId, BuildContext context) async {
  var Url = "http://localhost:30000/rest/rubriques";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "firstName": firstName,
        "lastName": lastName,
        "emailId": emailId,
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

class registerrubriqueState extends State<registerRubrique> {
  final minimumPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  rubriqueModel rubrique;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register rubrique"),
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
                    controller: firstController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        hintText: 'Enter Your First Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: lastController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Enter Your First Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: emailController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your email';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Email Id',
                        hintText: 'Enter Your Email Id',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              RaisedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    String firstName = firstController.text;
                    String lastName = lastController.text;
                    String emailId = emailController.text;
                    rubriqueModel rubriques = await registerrubriques(
                        firstName, lastName, emailId, context);
                    firstController.text = '';
                    lastController.text = '';
                    emailController.text = '';
                    setState(() {
                      rubrique = rubriques;
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
}*/
