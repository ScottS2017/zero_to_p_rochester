import 'package:flutter/material.dart';
import 'package:m11_adaptive_layout/pages/home.dart';

void main() => runApp(AdaptiveLayout());

class AdaptiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'm11 Adaptive Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Adaptive Layout'),
    );
  }
}