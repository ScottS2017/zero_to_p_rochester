import 'package:flutter/material.dart';
import 'package:m03_decorations/decorations_exercise.dart';
import 'package:m03_decorations/decorations_solution.dart';

class Home extends StatelessWidget {

  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Decorations'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const DecorationsExercise(),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Decorations Exercise'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const DecorationsSolution(),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Decorations Solution'),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}