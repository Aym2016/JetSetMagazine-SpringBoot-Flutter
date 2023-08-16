import 'package:flutter/material.dart';
import 'p_view.dart';
import 'package:toast/toast.dart';
import 'package:flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool decision = prefs.getBool('x');

  Widget _screen =
      (decision == false || decision == null) ? PView() : MyHomePage();

  runApp(_screen);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(primaryColor: Colors.blue, canvasColor: Colors.white),
      darkTheme:
          ThemeData(primaryColor: Colors.blue, canvasColor: Colors.black),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _x = GlobalKey<ScaffoldState>();

  String str = 'JetSetMag';

  int _currentIndex;
  List imgList = [
    'assets/assets/s1.jpg',
    'assets/s2.jpg',
    'assets/s3.jpg',
  ];

  int _radioValue = 0;
  String result;
  Color resultColor;

  bool js = false;
  bool cSharp = false;
  bool python = false;

  String get txt {
    String str = "You Selected:\n";
    if (js == true) str += "Javascript\n";
    if (cSharp == true) str += "C#\n";
    if (python == true)
      str += "Python\n";
    else
      str += "None\n";

    return str;
  }

  ThemeMode tm = ThemeMode.light;
  bool _swVal = false;

  String _selectedLetter;
  List _letterList = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JetSetMag',
      themeMode: tm,
      theme: ThemeData(primaryColor: Colors.blue, canvasColor: Colors.white),
      darkTheme: ThemeData(primaryColor: Colors.blue, canvasColor: Colors.pink),
      home: Scaffold(
        key: _x,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 1),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.account_circle),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent,
                Colors.pink,
                Colors.deepPurpleAccent,
              ],
            )),
          ),
          centerTitle: true,
          title: Text(
            str,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: null,
      ),
    );
  }

  ListView buildExpansionTile() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ExpansionTile(
            backgroundColor: Colors.blueGrey,
            leading: Icon(Icons.perm_identity),
            title: Text("Account"),
            children: [
              Divider(color: Colors.grey),
              Card(
                color: Colors.grey,
                child: ListTile(
                  leading: Icon(Icons.add),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Sign Up!"),
                  subtitle: Text("Where You Can Register An Account"),
                  onTap: buildSnackBar,
                ),
              ),
              Card(
                color: Colors.grey,
                child: ListTile(
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Sign In!"),
                  subtitle: Text("Where You Can Login With Your Account"),
                  onTap: buildSnackBar,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ExpansionTile(
            backgroundColor: Colors.blueGrey,
            leading: Icon(Icons.message),
            title: Text("MoreInfo"),
            children: [
              Divider(color: Colors.grey),
              Card(
                color: Colors.grey,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Contact"),
                  subtitle: Text("Where You Can Call Us"),
                  onTap: buildSnackBar,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Center buildDropdownButton() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Select A Letter!"),
          DropdownButton(
            hint: Text(" Select Letter!"),
            value: _selectedLetter,
            items: _letterList.map((item) {
              return DropdownMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                _selectedLetter = newVal;
              });
            },
          ),
        ],
      ),
    );
  }

  Center buildSwitch() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text("Light"),
          ),
          Switch(
            value: _swVal,
            onChanged: (bool value) {
              setState(() {
                _swVal = value;

                if (_swVal == false)
                  tm = ThemeMode.light;
                else
                  tm = ThemeMode.dark;
              });
            },
            activeColor: Colors.black,
            inactiveThumbColor: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text("Dark"),
          ),
        ],
      ),
    );
  }

  Padding buildCheckbox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text("Select All The Programing Languages You Know:"),
          Row(
            children: [
              Checkbox(
                value: js,
                onChanged: (value) {
                  setState(() {
                    js = value;
                  });
                },
              ),
              Text("JS"),
            ],
          ),
          CheckboxListTile(
            value: cSharp,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                cSharp = value;
              });
            },
            title: Text("C#"),
          ),
          Row(
            children: [
              Checkbox(
                value: python,
                onChanged: (value) {
                  setState(() {
                    python = value;
                  });
                },
              ),
              Text("Python"),
            ],
          ),
          RaisedButton(
            child: Text("Apply!"),
            onPressed: () {
              var ad = AlertDialog(
                title: Text("Thank You For Applying!"),
                content: Text(txt),
              );
              showDialog(builder: (context) => ad, context: context);
            },
          )
        ],
      ),
    );
  }

  RadioListTile buildRadioListTile(val, txt, subTxt) {
    return RadioListTile(
      value: val,
      groupValue: _radioValue,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value3) {
        setState(() {
          _radioValue = value3;
        });
      },
      title: Text(txt),
      subtitle: Text(subTxt, style: TextStyle(color: Colors.white)),
    );
  }

  Padding buildRadio() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            " Guess The Answer : 2+2=?",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          buildRow(3),
          buildRow(4),
          buildRow(5),
        ],
      ),
    );
  }

  myDialog() {
    var ad = AlertDialog(
      content: Container(
        height: 100,
        child: Column(
          children: [
            Text("$result", style: TextStyle(color: resultColor)),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Answer Is:4"),
            ),
          ],
        ),
      ),
    );
    // showDialog(context: context, child: ad);
    showDialog(builder: (context) => ad, context: context);
  }

  Row buildRow(int value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _radioValue,
          onChanged: (value) {
            setState(() {
              _radioValue = value;
              result = value == 4 ? "Correct Answer!" : "Wrong Answer!";
              resultColor = value == 4 ? Colors.green : Colors.redAccent;
              myDialog();
            });
          },
        ),
        Text("$value"),
      ],
    );
  }

  ListView buildCarousel() {
    return ListView(
      children: [
        SizedBox(height: 30),
        Text(
          "Slider 1: Initial Page Index 0\n\n",
          textAlign: TextAlign.center,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 186,
            initialPage: 0,
            autoPlay: true,
            onPageChanged: (index, _) {
              setState(() {
                _currentIndex = index;
              });
            },
            autoPlayInterval: Duration(seconds: 3),
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
          ),
          items: imgList.map((imageUrl) {
            return Container(
              width: double.infinity,
              //margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(imageUrl, fit: BoxFit.fill),
            );
          }).toList(),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildContainer(0),
            buildContainer(1),
            buildContainer(2),
          ],
        ),
        SizedBox(height: 30),
        Text(
          "Slider 2: Initial Page Index 1\n\n",
          textAlign: TextAlign.center,
        ),
        CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (_, int index) {
            return Container(
              width: double.infinity,
              //margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(imgList[index], fit: BoxFit.fill),
            );
          },
          options: CarouselOptions(
            height: 186,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            //reverse: true,
            pauseAutoPlayOnTouch: false,
            enableInfiniteScroll: false,
            initialPage: 0,
          ),
        ),
      ],
    );
  }

  Container buildContainer(index) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.redAccent : Colors.green,
      ),
    );
  }

  Column someTextProperty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SelectableText(
          "I'm A Copiable Text Select Me And See What Gonna Happen!",
          showCursor: true,
          cursorColor: Colors.green,
          cursorWidth: 10,
          toolbarOptions: ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 200,
          height: 40,
          color: Colors.green,
          child: Text(
            "This Is A Clipped Text,This Is A Clipped Text,This Is A Clipped Text,This Is A Clipped Text",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 200,
          height: 40,
          color: Colors.green,
          child: Text(
            "This Is A Ellipsis Text,This Is A Ellipsis Text,This Is A Ellipsis Text,This Is A Ellipsis Text",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 200,
          height: 40,
          color: Colors.green,
          child: Text(
            "This Is A Faded Text,This Is A Faded Text,This Is A Faded Text,This Is A Faded Text",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 200,
          height: 40,
          color: Colors.green,
          child: Text(
            "This Is A Visible Text,This Is A Visible Text,This Is A Visible Text,This Is A Visible Text",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            overflow: TextOverflow.visible,
            softWrap: false,
          ),
        ),
      ],
    );
  }

  void buildFlushBar(BuildContext context) {
    Flushbar(
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: FlatButton(
        child: Text("Close!"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      icon: Icon(Icons.info, color: Colors.white),
      backgroundColor: Colors.amber,
      title: "This Is The Title",
      messageText: Text("This Is The Message",
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
    ).show(context);
  }

  void buildSnackBar() {
    final sBar = SnackBar(
      action: SnackBarAction(
        textColor: Colors.black,
        label: "Undo!",
        onPressed: () {
          setState(() {
            str = 'Flutter Demo';
          });
        },
      ),
      content: Text("SnackBar Text"),
      duration: Duration(seconds: 8),
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
    _x.currentState.showSnackBar(sBar);
  }

  void buildDialog(BuildContext context) {
    final AlertDialog alert = AlertDialog(
      title: Text("Dialog Title"),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Divider(color: Colors.black),
            Text("Dialog Text Appear Here You Can type AnyThing You Want!"),
            SizedBox(height: 7),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.red,
                child: Text("Close !", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      builder: (context) => alert,
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.red.withOpacity(0.3),
    );
  }

  FlatButton buildFlatButton(BuildContext context) {
    return FlatButton(
      onPressed: () => showToast(context),
      child: buildRichText(),
    );
  }

  void showToast(BuildContext context) {
    Toast.show(
      "Pink/Amber",
      context,
      duration: Toast.LENGTH_LONG,
      gravity: 0,
      backgroundColor: Colors.amber,
      textColor: Colors.pink,
      backgroundRadius: 4,
    );
  }

  RichText buildRichText() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Pink",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35, color: Colors.pink)),
        TextSpan(
            text: "/",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.black)),
        TextSpan(
            text: "Amber",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.amber)),
      ]),
    );
  }
}
