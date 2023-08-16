import 'package:flutter/material.dart';
import 'package:jwt_token/Screens/home2.dart';
import 'package:splashscreen/splashscreen.dart';

class MainSplashScreen extends StatefulWidget {
  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          backgroundColor: Colors.blueAccent,
          photoSize: 180,
          image: Image.asset('images/s1.jpg'),
          seconds: 2,
          navigateAfterSeconds: MyHomePage(),
          title: Text("Splash Screen Tutorial"),
          loaderColor: Colors.yellow,
          loadingText: Text("Getting Page Ready!"),
        ),
      ),
    );
  }
}
