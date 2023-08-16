import 'package:flutter/material.dart';

class MyDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            /* gradient: LinearGradient(colors: [
          Colors.limeAccent[400],
          Colors.deepPurpleAccent /*Colors.deepOrange, Colors.white*/
        ])),*/
            gradient: LinearGradient(
          colors: [
            Colors.deepPurpleAccent,
            Colors.pink,
            Colors.deepPurpleAccent,
          ],
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/logo.png"),
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/logo.png"),
            ),
          ],
        ));
  }
}
