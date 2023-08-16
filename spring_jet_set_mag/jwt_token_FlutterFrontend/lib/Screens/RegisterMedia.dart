import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_token/utils/color.dart';
import 'package:jwt_token/widgets/btn_widget.dart';
import 'package:jwt_token/widgets/herder_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'package:jwt_token/widgets/header_container.dart';

class RegMedia extends StatefulWidget {
  @override
  _RegMedState createState() => _RegMedState();
}

class _RegMedState extends State<RegMedia> {
  final TextEditingController extensionController = TextEditingController();

  final TextEditingController contenuController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  save(String extensio, String contenu) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String roles;
    Map data = {"extension": extensio, "contenu": contenu};

    print(data);
    var jsonResponse = null;
    Map<String, String> headers = {"Content-Type": "application/json"};

    final msg = jsonEncode({"extensio": extensio, "contenu": contenu});

    var response = await http.post(
        "http://localhost:30000/api/auth/restMedia/medias",
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
            HeaderContainer(" add media"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "extension", icon: Icons.category),
                    _textInput1(hint: "contenu", icon: Icons.description),

                    /*_textInput2(hint: "Password", icon: Icons.vpn_key),
                    _textInput(hint: "username", icon: Icons.person),*/

                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER MEDIA",
                          onClick: () {
                            Navigator.pop(context);
                            save(extensionController.text,
                                contenuController.text);
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: " ", style: TextStyle(color: Colors.black)),
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
        controller: extensionController,
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
        controller: contenuController,
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
