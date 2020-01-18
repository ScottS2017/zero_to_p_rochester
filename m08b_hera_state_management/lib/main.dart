import 'package:flutter/material.dart';
import 'package:m08b_state_management_overview/pages/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const Example(),
    );
  }
}