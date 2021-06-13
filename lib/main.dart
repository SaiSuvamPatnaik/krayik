import 'package:doors_tour_app/screens/Authentication/Signin.dart';
import 'package:doors_tour_app/screens/News/news.dart';
import 'package:doors_tour_app/screens/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: signin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
