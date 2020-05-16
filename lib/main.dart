import 'package:flutter/material.dart';
import 'package:flutterpetadoptionui/screens/home_screen.dart';
import 'data/mock-data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pet Adoption UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFD6456),
      ),
      home: HomeScreen(),
    );
  }
}