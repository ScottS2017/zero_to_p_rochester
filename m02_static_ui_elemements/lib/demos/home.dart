import 'package:flutter/material.dart';
import 'package:m02_static_ui_elements/demos/no_scaffold_or_material.dart';
import 'package:m02_static_ui_elements/demos/samples.dart';
import 'package:m02_static_ui_elements/exercises/practice_part_one.dart';
import 'package:m02_static_ui_elements/exercises/practice_part_two.dart';
import 'package:m02_static_ui_elements/solutions/practice_part_one_solution.dart';
import 'package:m02_static_ui_elements/solutions/practice_part_two_solution.dart';

class Home extends StatelessWidget {

  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Static UI Elements'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// Material App Demo Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => NoScaffoldOrMaterial(),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('No Scaffold or Material Demo'),
                ),
              ),

              /// Samples Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const Samples(),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Samples'),
                ),
              ),

              /// Part One Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const PracticePartOne(),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Practice Part 1'),
                ),
              ),

              /// Part One Solution Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const PracticePartOneSolution(),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Practice Part 1 Solution'),
                ),
              ),

              /// Part Two Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const PracticePartTwo(),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Container Practice Part 2'),
                ),
              ),

              /// Part Two Solution Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<Route>(builder:
                      (context) => const PracticePartTwoSolution(),
                    ),
                  ),
                  color: Colors.grey[300],
                  child: const Text('Container Practice Part 2 Solution'),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}