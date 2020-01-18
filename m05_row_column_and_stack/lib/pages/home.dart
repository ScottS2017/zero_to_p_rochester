import 'package:flutter/material.dart';
import 'package:m04_text_and_text_style/pages/examples.dart';
import 'package:m04_text_and_text_style/pages/exercises.dart';
import 'package:m04_text_and_text_style/pages/solutions.dart';

class Home extends StatelessWidget {

  final String title;

  const Home({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// Examples Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const TextExamples(title: 'Examples',),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Examples'),
                ),
              ),

              /// Exercises Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const TextExercises(title: 'Exercises'),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Exercises'),
                ),
              ),

              /// Solutions Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const TextSolutions(title: 'Solutions',),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Solutions'),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}