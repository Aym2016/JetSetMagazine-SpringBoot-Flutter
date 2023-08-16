import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'home2.dart';
import 'main_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  final String title;
  final String description;
  final String imageUrl;
  final IconData iconData;

  Data({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.iconData,
  });
}

class PView extends StatefulWidget {
  @override
  _PViewState createState() => _PViewState();
}

class _PViewState extends State<PView> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  int _currentIndex = 0;
  final _pageIndexNotifier = ValueNotifier<int>(0);

  final List<Data> myData = [
    Data(
      title: "Title 1",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      imageUrl: "images/q1.jpg",
      iconData: Icons.add_box,
    ),
    Data(
      title: "Title 2",
      description:
          "Sed do eiusmod tempor et dolore magna aliqua. Ut enim ad minim veniam",
      imageUrl: "images/q2.jpg",
      iconData: Icons.add_circle,
    ),
    Data(
      title: "Title 3",
      description:
          "Quis nostrud exercitation ullamco laboris nisi ut aliquip ex consequat.",
      imageUrl: "images/q3.jpg",
      iconData: Icons.add_circle_outline,
    ),
    Data(
      title: "Title 4",
      description:
          "Duis aute irure dolor in reprehenderit in voluptatenulla pariatur.",
      imageUrl: "images/q4.jpg",
      iconData: Icons.add_comment,
    ),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 6), (timer) {
      if (_currentIndex < 3) _currentIndex++;

      _controller.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/a': (ctx) => MyHomePage(),
        '/b': (ctx) => MainSplashScreen(),
      },
      home: Scaffold(
        body: Stack(
          alignment: Alignment(0, 0.7),
          children: [
            Builder(
              builder: (ctx) => PageView(
                controller: _controller,
                children: myData
                    .map(
                      (item) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(item.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item.iconData, size: 130),
                            SizedBox(height: 50),
                            Text(item.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                )),
                            SizedBox(height: 10),
                            Text(
                              item.description,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onPageChanged: (val) {
                  _pageIndexNotifier.value = val;
                  setState(() {
                    _currentIndex = val;
                    /*if (_currentIndex == 3) {
                      Future.delayed(Duration(seconds: 2),
                          () => Navigator.of(ctx).pushNamed('/b'));
                    }*/
                  });
                },
              ),
            ),
            PageViewIndicator(
              pageIndexNotifier: _pageIndexNotifier,
              length: myData.length,
              normalBuilder: (_, index) => Circle(
                size: 8.0,
                color: Colors.white,
              ),
              highlightedBuilder: (animationController, _) => ScaleTransition(
                scale: CurvedAnimation(
                    parent: animationController, curve: Curves.ease),
                child: Icon(Icons.star),
              ),
            ),
            //Indicator(_currentIndex),
            Builder(
              builder: (ctx) => Align(
                alignment: Alignment(0, 0.93),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: RaisedButton(
                    padding: EdgeInsets.all(7),
                    color: Colors.red,
                    child: Text("GET STARTED",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    onPressed: () async {
                      Navigator.of(ctx).pushNamed('/b');

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('x', true);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int index;

  Indicator(this.index);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(0, index == 0 ? Colors.green : Colors.red),
          buildContainer(1, index == 1 ? Colors.green : Colors.red),
          buildContainer(2, index == 2 ? Colors.green : Colors.red),
          buildContainer(3, index == 3 ? Colors.green : Colors.red),
        ],
      ),
    );
  }

  Widget buildContainer(int i, Color color) {
    return index == i
        ? Icon(Icons.star)
        : Container(
            margin: EdgeInsets.all(4),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          );
  }
}
