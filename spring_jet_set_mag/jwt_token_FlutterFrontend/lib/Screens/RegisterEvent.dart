import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_token/utils/color.dart';
import 'package:jwt_token/widgets/btn_widget.dart';
import 'package:jwt_token/widgets/herder_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'package:jwt_token/widgets/header_container.dart';

class RegEvent extends StatefulWidget {
  @override
  _RegEventState createState() => _RegEventState();
}

class _RegEventState extends State<RegEvent> {
  final TextEditingController titreController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  save(String titre, String description) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String roles;
    Map data = {"titre ": titre, "description": description};

    print(data);
    var jsonResponse = null;
    Map<String, String> headers = {"Content-Type": "application/json"};

    final msg = jsonEncode({"titre": titre, "description": description});

    var response = await http.post(
        "http://localhost:30000/api/auth/restEvent/Event",
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
            HeaderContainer(" add Event"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "titre", icon: Icons.title),
                    _textInput1(hint: "description", icon: Icons.description),

                    /*_textInput2(hint: "Password", icon: Icons.vpn_key),
                    _textInput(hint: "username", icon: Icons.person),*/

                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER EVENT",
                          onClick: () {
                            Navigator.pop(context);
                            save(titreController.text,
                                descriptionController.text);
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
        controller: titreController,
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
        controller: descriptionController,
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
