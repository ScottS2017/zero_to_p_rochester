import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HeraSelfContainedExample());
}

class HeraSelfContainedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReactiveModel-View Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Provider<HeraModel>(
      create: (context) => HeraModel(),
      child: const MaterialApp(
        home: UserInterface(title: 'H.E.R.A. Example'),
      ),
    );
  }
}

class UserInterface extends StatelessWidget {
  const UserInterface({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final heraInstance = Provider.of<HeraModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ValueListenableBuilder<Color>(
              valueListenable: heraInstance.firstColor,
              builder: (BuildContext context, Color color, _) {
                return FloatingActionButton(
                  backgroundColor: heraInstance.firstColor.value,
                  onPressed: () => heraInstance.reactByChangingTheColor(),
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: Colors.black54,
                  ),
                );
              },
            ),
            FloatingActionButton(
              onPressed: () => heraInstance.reactByChangingTheColor(),
              child: Icon(
                Icons.settings_power,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeraModel {
  ValueNotifier<Color> firstColor = ValueNotifier<Color>(Colors.white);
  void reactByChangingTheColor() {
    firstColor.value == Colors.white
        ? firstColor.value = Colors.yellow
        : firstColor.value == Colors.yellow
            ? firstColor.value = Colors.orange
            : firstColor.value == Colors.orange
                ? firstColor.value = Colors.purple
                : firstColor.value == Colors.purple
                    ? firstColor.value = Colors.white
                    : print('The color value passed to reactByChangingTheColor was invalid.');
  }
}