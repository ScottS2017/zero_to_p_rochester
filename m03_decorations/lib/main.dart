import 'package:flutter/material.dart';
import 'package:m03_decorations/home.dart';

void main() => runApp(Decorations());

class Decorations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decorations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
