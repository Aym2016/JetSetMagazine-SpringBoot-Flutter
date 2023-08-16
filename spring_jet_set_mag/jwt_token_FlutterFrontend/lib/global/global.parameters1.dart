import 'dart:js';

import 'package:flutter/material.dart';
import 'package:jwt_token/Screens/registerComment.dart';
//import 'package:jwt_token/pages/AjoutArticle.page.dart';
//import 'package:jwt_token/Screens/getrubriques.dart';
import 'package:jwt_token/pages/contacts.page.dart';
import 'package:jwt_token/pages/counter.page.dart';
import 'package:jwt_token/pages/gallery.page.dart';
import 'package:jwt_token/pages/home.page.dart';
import 'package:jwt_token/pages/meteo.page.dart';
import 'package:jwt_token/Screens/RegisterArticle.dart';
import 'package:jwt_token/Screens/registerRubrique.dart';

//import 'package:jwt_token/view/regi_page.dart';

class GlobalParameters1 {
  static final routes = {
    "/": (context) => HomePage(),
    /* "/counter": (context) => CounterPage(),
    "/contacts": (context) => ContactsPage(),
    "/meteo": (context) => MeteoPage(),
    "/gallery": (context) => GalleryPage(),*/
    // "/getComments": (context) => getcomments(),
    //"/rubriqueDrawer": (context) => rubriqueDrawer(),
    "/RegisterArticle": (context) => RegArticle(),
    "/registerComment": (context) => RegComment(),
    "/RegisterRubrique": (context) => RegRubrique(),
  };
  static final menus = [
    {"title": "Home", "route": "/", "icon": Icon(Icons.home)},
    /* {"title": "Counter", "route": "/counter", "icon": Icon(Icons.memory)},
    {"title": "Contacts", "route": "/contacts", "icon": Icon(Icons.contacts)},
    {"title": "Meteo", "route": "/meteo", "icon": Icon(Icons.repeat)},
    {"title": "Gallery", "route": "/gallery", "icon": Icon(Icons.camera)},*/
    {
      "title": "Article",
      "route": "/RegisterArticle",
      "icon": Icon(Icons.article)
    },
    {
      "title": "Commentaire",
      "route": "/registerComment",
      "icon": Icon(Icons.comment)
    },
    {
      "title": "Rubriques",
      "route": "/registerRubrique",
      "icon": Icon(Icons.category)
    },
    {
      "title": "registration",
      "route": "/regi_page",
      "icon": Icon(Icons.app_registration)
    },
  ];
}
