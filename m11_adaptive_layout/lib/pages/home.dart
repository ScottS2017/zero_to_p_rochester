import 'package:flutter/material.dart';
import 'package:m11_adaptive_layout/exercise/exercise.dart';
import 'package:m11_adaptive_layout/pages/calculating_borders.dart';
import 'package:m11_adaptive_layout/pages/percentage_for_expandeds.dart';
import 'package:m11_adaptive_layout/pages/using_a_fraction_of_space.dart';
import 'package:m11_adaptive_layout/pages/using_ratios.dart';
import 'package:m11_adaptive_layout/solutions/exercise_solution.dart';

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
              ///
              /// Examples Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const UsingRatios(title: 'Using Ratios',),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Using Ratios'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const CalculatingBorders(title: 'Calculating Borders',),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Calculating Borders'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const UsingFractionOfSpace(title: 'Using Only a Fraction',),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Using a Fraction of Available Space'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const PercentagesForExpandeds(title: 'Percentages with Expandeds',),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Using Percentages with Expandeds'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const Exercise(title: 'Exercises',),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Exercises'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const ExerciseSolution(title: 'Exercise Solutions',),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Exercise Solutions'),
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}