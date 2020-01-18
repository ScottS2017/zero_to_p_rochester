import 'package:flutter/material.dart';
import 'package:m01_organizing_a_flutter_app/pages/home.dart';

/// To use Extra Pedantic:
///
/// In pubspec.yaml:
///
/// dev_dependencies:
///  flutter_test:
///    sdk: flutter
///  extra_pedantic: any
///
/// Then add this to analysis_options.yaml or make a new one:
///
///     include: package:extra_pedantic/analysis_options.yaml
///
/// or if you want to enforce sort_child_properties_last and disable always_put_required_named_parameters_first. (for Flutter modules):
///     include: package:extra_pedantic/analysis_options_flutter.yaml

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App Oranization Device Menu Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Sample App Organization AppBar Title'),
    );
  }
}