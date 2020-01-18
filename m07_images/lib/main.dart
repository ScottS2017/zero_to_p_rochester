import 'package:flutter/material.dart';
import 'package:m07_images/hera_objects/example_hera_model.dart';
import 'package:m07_images/pages/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<HeraObject>(
      create: (context) => HeraObject(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'm07 Images',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}