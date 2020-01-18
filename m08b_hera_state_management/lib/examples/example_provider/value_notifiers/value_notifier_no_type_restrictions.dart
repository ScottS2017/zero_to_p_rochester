import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m08_state_management_overview/widgets/page_layout.dart';
import 'package:provider/provider.dart';

class ValueNotifierNotRestrictedToTypeApproachApp extends StatefulWidget {
  const ValueNotifierNotRestrictedToTypeApproachApp({Key key}) : super(key: key);

  @override
  _ValueNotifierNotRestrictedToTypeApproachAppState createState() =>
      _ValueNotifierNotRestrictedToTypeApproachAppState();
}

class _ValueNotifierNotRestrictedToTypeApproachAppState extends State<ValueNotifierNotRestrictedToTypeApproachApp> {
  /// We need to provide the model so we create an instance
  final _model = ValueNotifierNotRestrictedToTypeApproachModel();

  @override
  Widget build(BuildContext context) {
    /// Create our provider
    return Provider<ValueNotifierNotRestrictedToTypeApproachModel>(
      builder: (context) => _model,
      child: const MaterialApp(
        /// This next widget runs its own build method, creating a new context that will
        /// contain our Provider that was created above
        home: ValueNotifierNotRestrictedToTypeApproachExampleHome(),
      ),
    );
  }
}

class ValueNotifierNotRestrictedToTypeApproachExampleHome extends StatelessWidget {
  const ValueNotifierNotRestrictedToTypeApproachExampleHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// PageLayout is a custom Widget that handles all the page formatting so it doesn't clutter up this file,
    /// while we're trying to focus on what's happening.
    return PageLayout(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('ValueNotifier No Type Restrictions'),
      ),
      cubes: <Widget>[
        /// We create a normal Consumer, the same as we would for a ChangeNotifierProvider.
        /// The big difference here is that our Model isn't extending ChangeNotifier, so the model
        /// object itself doesn't utilize notifyListeners and so isn't going to provide any updates
        /// on changes.
        ///
        /// Instead, each variable is using a ValueNotifier to send updates of each variable.
        ///
        /// But we still need to provide access to (AKA "expose") our model. This is why we still use
        /// a Provider and Consumer in this code.
        Consumer<ValueNotifierNotRestrictedToTypeApproachModel>(
          /// The second parameter of our builder tells us which object we're listening to
          builder: (BuildContext locallyScopedContext,
              ValueNotifierNotRestrictedToTypeApproachModel objectWeAreListeningTo, Widget child) {
            return ValueListenableBuilder<bool>(
              /// The valueListenable tells us to listen to the cube3 variable of our object
              valueListenable: objectWeAreListeningTo.yellowCube,
              builder: (BuildContext context, bool anInstanceOfTheValueWeAreListeningTo, Widget child) {
                return Container(
                  color: anInstanceOfTheValueWeAreListeningTo == true ? Colors.yellow : Colors.transparent,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Both of these use the same Type, a Bool',
                    style: TextStyle(
                      color: anInstanceOfTheValueWeAreListeningTo == true ? Colors.black54 : Colors.white,
                      fontSize: 32,
                    ),
                  ),
                );
              },
            );
          },
        ),
        Consumer<ValueNotifierNotRestrictedToTypeApproachModel>(
          builder: (BuildContext locallyScopedContext,
              ValueNotifierNotRestrictedToTypeApproachModel objectWeAreListeningTo, Widget child) {
            return ValueListenableBuilder<bool>(
              valueListenable: objectWeAreListeningTo.cyanCube,
              builder: (BuildContext context, bool anInstanceOfTheValueWeAreListeningTo, Widget child) {
                return Container(
                  color: anInstanceOfTheValueWeAreListeningTo == true ? Colors.cyan : Colors.transparent,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'This approach allows you to do that, but you can\'t mix it with a Provider.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
      buttons: <Widget>[
        Consumer<ValueNotifierNotRestrictedToTypeApproachModel>(
          builder:
              (BuildContext locallyScopedContext, ValueNotifierNotRestrictedToTypeApproachModel model, Widget child) {
            return ValueListenableBuilder<bool>(
              valueListenable: model.yellowCube,
              builder: (BuildContext context, bool theValueWeAreListeningTo, Widget child) {
                return FloatingActionButton(
                  backgroundColor: theValueWeAreListeningTo == true ? Colors.yellow : Colors.transparent,
                  onPressed: () => Provider.of<ValueNotifierNotRestrictedToTypeApproachModel>(context, listen: false)
                      .toggleTheYellowCube(),
                  child: Icon(Icons.autorenew),
                );
              },
            );
          },
        ),
        Consumer<ValueNotifierNotRestrictedToTypeApproachModel>(
          builder:
              (BuildContext locallyScopedContext, ValueNotifierNotRestrictedToTypeApproachModel model, Widget child) {
            return ValueListenableBuilder<bool>(
              valueListenable: model.cyanCube,
              builder: (BuildContext context, bool theValueWeAreListeningTo, Widget child) {
                return FloatingActionButton(
                  backgroundColor: theValueWeAreListeningTo == true ? Colors.cyan : Colors.transparent,
                  onPressed: () => Provider.of<ValueNotifierNotRestrictedToTypeApproachModel>(context, listen: false)
                      .toggleTheCyanCube(),
                  child: Icon(Icons.autorenew),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class ValueNotifierNotRestrictedToTypeApproachModel {
  final _yellowCube = ValueNotifier<bool>(true);
  ValueNotifier<bool> get yellowCube => _yellowCube;

  final _cyanCube = ValueNotifier<bool>(true);
  ValueNotifier<bool> get cyanCube => _cyanCube;

  /// Logic:
  void toggleTheYellowCube() {
    _yellowCube.value = !_yellowCube.value;
  }

  void toggleTheCyanCube() {
    _cyanCube.value = !_cyanCube.value;
  }
}
