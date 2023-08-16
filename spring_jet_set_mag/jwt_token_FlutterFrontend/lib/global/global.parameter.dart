import 'dart:js';

import 'package:flutter/material.dart';
import 'package:jwt_token/Model/image_model.dart';
import 'package:jwt_token/Screens/TrouverPlans.dart';
import 'package:jwt_token/Screens/VideoPlayerApp.dart';
import 'package:jwt_token/Screens/registerComment.dart';
import 'package:jwt_token/Screens/RegisterMedia.dart';
import 'package:jwt_token/ScreensUser/MyApp3.dart';
//import 'package:jwt_token/pages/AjoutArticle.page.dart';
//import 'package:jwt_token/Screens/getrubriques.dart';
import 'package:jwt_token/pages/contacts.page.dart';
import 'package:jwt_token/pages/counter.page.dart';
import 'package:jwt_token/pages/gallery.page.dart';
import 'package:jwt_token/pages/home.page.dart';
import 'package:jwt_token/pages/meteo.page.dart';
import 'package:jwt_token/Screens/RegisterArticle.dart';
import 'package:jwt_token/Screens/registerRubrique.dart';
import 'package:jwt_token/ScreensUser/image_list.dart';
import 'package:jwt_token/ScreensUser/MyApp3.dart';
import 'package:jwt_token/Screens/RegisterEvent.dart';
import 'package:jwt_token/Screens/getarticles.dart';
import 'package:jwt_token/Screens/home2.dart';
import 'package:jwt_token/Screens/home3.dart';
import 'package:jwt_token/Screens/VideoPlayerApp.dart';
import 'package:jwt_token/Screens/YoutubePlayerWidget.dart';

//import 'package:jwt_token/ScreensUser/HomeVideo.dart';
//import 'package:jwt_token/view/regi_page.dart';

class GlobalParameters {
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
    "/registerRubrique": (context) => RegRubrique(),
    "/Image_List": (context) => ImageList(images),
    "/MyApp3": (context) => MyApp3(),
    "/RegisterMedia": (context) => RegMedia(),
    "/RegisterEvent": (context) => RegEvent(),
    "/TrouverPlans": (context) => TrouverPlans(),
    "/getarticles": (context) => getarticles(),
    "/home2": (context) => MyApp(),
    "/home3": (context) => VideoExample(),
    "/VideoPlayerApp": (context) => VideoPlayerApp(),
    "/YoutubePlayerWidget": (context) => YoutubePlayerWidget(
        videoUrl: 'https://www.youtube.com/watch?v=dSBRQUebo7g'),
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
    {"title": "images", "route": "/Image_List", "icon": Icon(Icons.image)},
    {"title": "article images", "route": "/MyApp3", "icon": Icon(Icons.image)},
    {
      "title": "home video",
      "route": "/homeVideo",
      "icon": Icon(Icons.video_library)
    },
    {
      "title": "Event Registration",
      "route": "/RegisterEvent",
      "icon": Icon(Icons.video_library)
    },
    {
      "title": "Trouver plans",
      "route": "/TrouverPlans",
      "icon": Icon(Icons.place_rounded)
    },
    {
      "title": "liste des articles",
      "route": "/getarticles",
      "icon": Icon(Icons.image_aspect_ratio)
    },
    {
      "title": "home JetSetMag",
      "route": "/home2",
      "icon": Icon(Icons.image_aspect_ratio)
    },
    {
      "title": "video JetSetMag",
      "route": "/home3",
      "icon": Icon(Icons.image_aspect_ratio)
    },
    {
      "title": "video JetSetMag2",
      "route": "/VideoPlayerApp",
      "icon": Icon(Icons.image_aspect_ratio)
    },
    {
      "title": "Youtube Player",
      "route": "/YoutubePlayerWidget",
      "icon": Icon(Icons.image_aspect_ratio)
    },
  ];

  static List<ImageModel> get images => null;
}
