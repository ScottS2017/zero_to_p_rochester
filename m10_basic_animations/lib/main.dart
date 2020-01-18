import 'package:flutter/material.dart';
import 'package:m10_basic_animations/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M10 Basic Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Basic Animations'),
    );
  }
}