import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_token/utils/color.dart';
import 'package:jwt_token/widgets/btn_widget.dart';
import 'package:jwt_token/widgets/herder_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'package:jwt_token/widgets/header_container.dart';

class RegComment extends StatefulWidget {
  @override
  _RegCommentState createState() => _RegCommentState();
}

class _RegCommentState extends State<RegComment> {
  final TextEditingController texteController = TextEditingController();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  save(String texte, String date) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String roles;
    Map data = {"date_com": date, "texte_com": texte};

    print(data);
    var jsonResponse = null;
    Map<String, String> headers = {"Content-Type": "application/json"};

    final msg = jsonEncode({"date_com": date, "texte_com": texte});

    var response = await http.post(
        "http://localhost:30000/api/auth/restCommentaire/commentaires",
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
            HeaderContainer(" add commentaire"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "texte commentaire", icon: Icons.comment),
                    _textInput1(
                        hint: "date commentaire", icon: Icons.date_range),
                    /*_textInput2(hint: "Password", icon: Icons.vpn_key),
                    _textInput(hint: "username", icon: Icons.person),*/

                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER Comment",
                          onClick: () {
                            Navigator.pop(context);
                            save(texteController.text, dateController.text);
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
        controller: texteController,
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
        controller: dateController,
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

import 'package:jwt_token/Model/commentModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class registercomment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registercommentState();
  }
}

Future<CommentModel> registercomments(
    String texte, String date, BuildContext context) async {
  var Url = "http://localhost:30000/rest/comments";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "texte_com": texte,
        "date_com": date,
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

class registercommentState extends State<registercomment> {
  final minimumPadding = 5.0;

  TextEditingController texteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  //TextEditingController emailController = TextEditingController();

  CommentModel comment;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register comment"),
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
                    controller: texteController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your texte';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'texte',
                        hintText: 'Enter Your comment',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: texteController,
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
              RaisedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    String texte = texteController.text;
                    String date = dateController.text;

                    CommentModel comments =
                        await registercomments(texte, date, context);
                    texteController.text = '';
                    dateController.text = '';
                    //emailController.text = '';
                    setState(() {
                      comment = comments;
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
