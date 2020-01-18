import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: const Text('Your App Here'),
    );
  }
}
