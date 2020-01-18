import 'package:flutter/material.dart';
import 'package:m04_text_and_text_style/pages/exercises.dart';
import 'package:m04_text_and_text_style/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter: Basic Text and TextStyles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Basic Text and TextStyles'),
    );
  }
}