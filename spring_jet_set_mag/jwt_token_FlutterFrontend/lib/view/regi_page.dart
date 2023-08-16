import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_token/utils/color.dart';
import 'package:jwt_token/widgets/btn_widget.dart';
import 'package:jwt_token/widgets/herder_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'package:jwt_token/widgets/header_container.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  save(String username, String password, String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String roles;
    Map data = {"email": email, "password": password, "username": username};

    print(data);
    var jsonResponse = null;
    Map<String, String> headers = {"Content-Type": "application/json"};

    final msg = jsonEncode({
      "email": email,
      "username": username,
      "password": password,
    });

    var response = await http.post("http://localhost:30000/api/auth/signup",
        body: msg, headers: headers);
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
            HeaderContainer("Register"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput1(hint: "email", icon: Icons.email),
                    //_textInput(hint: "Phone Number", icon: Icons.call),
                    _textInput2(hint: "Password", icon: Icons.vpn_key),
                    _textInput(hint: "username", icon: Icons.person),

                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER",
                          onClick: () {
                            Navigator.pop(context);
                            save(usernameController.text,
                                passwordController.text, emailController.text);
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
        controller: emailController,
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
        controller: passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
