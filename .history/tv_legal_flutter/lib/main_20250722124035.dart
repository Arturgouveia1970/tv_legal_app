
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'map_page.dart';
import 'player_page.dart';
import 'feedback_form_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Legal App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
routes: {
'/': (context) => HomePage(),
'/map': (context) => MapPage(),
'/player': (context) => PlayerPage(),
'/feedback': (context) => FeedbackFormPage(),
},
);
}
}